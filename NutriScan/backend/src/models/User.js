// User model
const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    passwordHash: { type: String, required: true },
    profileImageUrl: { type: String },
    tmb: { type: Number }, // Taxa Metabólica Basal
    targetKcal: { type: Number }, // Meta calórica diária
    weeklyGoal: {
        targetKcal: { type: Number, default: 0 },
        completedKcal: { type: Number, default: 0 },
        progress: { type: Number, default: 0 }
    },
    macrosGoals: {
        protein: { type: Number, default: 0 },
        carbs: { type: Number, default: 0 },
        fat: { type: Number, default: 0 }
    },
    createdAt: { type: Date, default: Date.now },
    updatedAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('User', UserSchema);