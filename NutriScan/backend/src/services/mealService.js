const Meal = require('../models/Meal');
const User = require('../models/User'); // Para talvez atualizar os totais do usuário

const createMeal = async (mealData) => {
    const newMeal = new Meal(mealData);
    await newMeal.save();

    // Opcional: Atualizar a meta calórica semanal do usuário
    // Isso pode ser uma lógica mais complexa, mas para um MVP, podemos apenas somar
    const user = await User.findById(mealData.userId);
    if (user && user.weeklyGoal) {
        user.weeklyGoal.completedKcal = (user.weeklyGoal.completedKcal || 0) + newMeal.totalCalories;
        // Calcular progresso: (completedKcal / targetKcal) * 100
        if (user.weeklyGoal.targetKcal > 0) {
            user.weeklyGoal.progress = (user.weeklyGoal.completedKkcal / user.weeklyGoal.targetKcal) * 100;
        } else {
            user.weeklyGoal.progress = 0;
        }
        await user.save();
    }

    return newMeal;
};

const getMealsByUserIdAndDate = async (userId, date) => {
    // Para buscar refeições de um dia específico (ignora a hora)
    const startOfDay = new Date(date);
    startOfDay.setUTCHours(0, 0, 0, 0);

    const endOfDay = new Date(date);
    endOfDay.setUTCHours(23, 59, 59, 999);

    const meals = await Meal.find({
        userId,
        date: { $gte: startOfDay, $lte: endOfDay }
    }).sort({ date: 1 }); // Ordenar por data/hora

    return meals;
};

const getMealById = async (mealId, userId) => {
    // Garante que o usuário só possa ver suas próprias refeições
    const meal = await Meal.findOne({ _id: mealId, userId });
    if (!meal) {
        throw new Error('Refeição não encontrada ou você não tem permissão para vê-la.');
    }
    return meal;
};

const updateMeal = async (mealId, userId, updateData) => {
    const meal = await Meal.findOneAndUpdate(
        { _id: mealId, userId }, // Critério de busca: ID da refeição E ID do usuário
        updateData,
        { new: true, runValidators: true } // Retorna o documento atualizado e executa validadores
    );
    if (!meal) {
        throw new Error('Refeição não encontrada ou você não tem permissão para atualizá-la.');
    }

    // Opcional: Re-atualizar a meta calórica semanal do usuário após a atualização da refeição
    const user = await User.findById(userId);
    if (user && user.weeklyGoal) {
        // Lógica mais robusta aqui para recalcular o total semanal
        // Por agora, vamos simular uma recomputação simplificada (melhorar depois)
        const allMeals = await Meal.find({ userId, date: { $gte: getStartOfWeek(new Date()), $lte: getEndOfWeek(new Date()) } });
        user.weeklyGoal.completedKcal = allMeals.reduce((acc, currentMeal) => acc + currentMeal.totalCalories, 0);
        if (user.weeklyGoal.targetKcal > 0) {
            user.weeklyGoal.progress = (user.weeklyGoal.completedKcal / user.weeklyGoal.targetKcal) * 100;
        } else {
            user.weeklyGoal.progress = 0;
        }
        await user.save();
    }

    return meal;
};

const deleteMeal = async (mealId, userId) => {
    const meal = await Meal.findOneAndDelete({ _id: mealId, userId });
    if (!meal) {
        throw new Error('Refeição não encontrada ou você não tem permissão para deletá-la.');
    }

    // Opcional: Atualizar a meta calórica semanal do usuário após a exclusão da refeição
    const user = await User.findById(userId);
    if (user && user.weeklyGoal) {
        user.weeklyGoal.completedKcal = (user.weeklyGoal.completedKcal || 0) - meal.totalCalories;
        if (user.weeklyGoal.targetKcal > 0) {
            user.weeklyGoal.progress = (user.weeklyGoal.completedKcal / user.weeklyGoal.targetKcal) * 100;
        } else {
            user.weeklyGoal.progress = 0;
        }
        await user.save();
    }

    return meal;
};


// Função auxiliar para semana (poderia ser movida para utils)
const getStartOfWeek = (date) => {
    const d = new Date(date);
    const day = d.getDay(); // Sunday - 0, Monday - 1, etc.
    const diff = d.getDate() - day + (day === 0 ? -6 : 1); // Adjust when day is sunday
    d.setDate(diff);
    d.setUTCHours(0,0,0,0);
    return d;
}

const getEndOfWeek = (date) => {
    const d = getStartOfWeek(date);
    d.setDate(d.getDate() + 6);
    d.setUTCHours(23,59,59,999);
    return d;
}


module.exports = {
    createMeal,
    getMealsByUserIdAndDate,
    getMealById,
    updateMeal,
    deleteMeal,
};