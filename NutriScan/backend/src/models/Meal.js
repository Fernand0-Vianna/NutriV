const mongoose = require('mongoose');

const FoodItemSchema = new mongoose.Schema({
    foodName: { type: String, required: true },
    recognizedImageUrl: { type: String }, // URL da imagem do alimento reconhecido (opcional)
    quantityGrams: { type: Number, required: true }, // Quantidade em gramas ou outra unidade de medida
    macros: {
        protein: { type: Number, default: 0 },
        carbs: { type: Number, default: 0 },
        fat: { type: Number, default: 0 },
        calories: { type: Number, default: 0 }
    },
    source: { type: String, enum: ['camera', 'manual', 'search'], default: 'manual' } // Como o alimento foi adicionado
});

const MealSchema = new mongoose.Schema({
    userId: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    date: {
        type: Date,
        required: true,
        default: Date.now // Define a data atual por padrão
    },
    mealType: {
        type: String,
        enum: ['Breakfast', 'Lunch', 'Dinner', 'Snack', 'Other'],
        required: true
    },
    foodItems: [FoodItemSchema], // Array de itens alimentares na refeição
    totalCalories: {
        type: Number,
        default: 0
    },
    totalProtein: { type: Number, default: 0 },
    totalCarbs: { type: Number, default: 0 },
    totalFat: { type: Number, default: 0 },
    createdAt: {
        type: Date,
        default: Date.now
    },
    updatedAt: {
        type: Date,
        default: Date.now
    }
});

// Middleware para atualizar totalCalories, totalProtein, totalCarbs, totalFat antes de salvar
MealSchema.pre('save', function(next) {
    let totalCals = 0;
    let totalProt = 0;
    let totalCarbs = 0;
    let totalFat = 0;

    this.foodItems.forEach(item => {
        totalCals += item.macros.calories || 0;
        totalProt += item.macros.protein || 0;
        totalCarbs += item.macros.carbs || 0;
        totalFat += item.macros.fat || 0;
    });

    this.totalCalories = totalCals;
    this.totalProtein = totalProt;
    this.totalCarbs = totalCarbs;
    this.totalFat = totalFat;
    this.updatedAt = Date.now(); // Atualiza o timestamp de atualização

    next();
});

module.exports = mongoose.model('Meal', MealSchema);