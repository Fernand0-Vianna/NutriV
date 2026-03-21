const mealService = require('../services/mealService');

const createMeal = async (req, res) => {
    try {
        const userId = req.user.id; // Obtido do middleware de autenticação
        const mealData = { ...req.body, userId }; // Adiciona o userId aos dados da refeição
        const newMeal = await mealService.createMeal(mealData);
        res.status(201).json(newMeal);
    } catch (e) {
        res.status(400).json({ msg: e.message });
    }
};

const getMeals = async (req, res) => {
    try {
        const userId = req.user.id;
        const { date } = req.query; // Pode receber uma data via query param (ex: ?date=2023-10-26)

        let meals;
        if (date) {
            meals = await mealService.getMealsByUserIdAndDate(userId, new Date(date));
        } else {
            // Se nenhuma data for fornecida, retorna as refeições do dia atual por padrão
            meals = await mealService.getMealsByUserIdAndDate(userId, new Date());
        }

        res.status(200).json(meals);
    } catch (e) {
        res.status(400).json({ msg: e.message });
    }
};

const getMeal = async (req, res) => {
    try {
        const userId = req.user.id;
        const mealId = req.params.id;
        const meal = await mealService.getMealById(mealId, userId);
        res.status(200).json(meal);
    } catch (e) {
        res.status(404).json({ msg: e.message });
    }
};

const updateMeal = async (req, res) => {
    try {
        const userId = req.user.id;
        const mealId = req.params.id;
        const updatedMeal = await mealService.updateMeal(mealId, userId, req.body);
        res.status(200).json(updatedMeal);
    } catch (e) {
        res.status(400).json({ msg: e.message });
    }
};

const deleteMeal = async (req, res) => {
    try {
        const userId = req.user.id;
        const mealId = req.params.id;
        const deletedMeal = await mealService.deleteMeal(mealId, userId);
        res.status(200).json({ msg: 'Refeição deletada com sucesso', meal: deletedMeal });
    } catch (e) {
        res.status(404).json({ msg: e.message });
    }
};

module.exports = {
    createMeal,
    getMeals,
    getMeal,
    updateMeal,
    deleteMeal,
};