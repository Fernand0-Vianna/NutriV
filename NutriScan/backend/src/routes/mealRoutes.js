const express = require('express');
const router = express.Router();
const mealController = require('../controllers/mealController');
const authMiddleware = require('../middlewares/auth');

// Todas as rotas de refeições exigem autenticação
router.use(authMiddleware);

// @route   POST /api/meals
// @desc    Registrar uma nova refeição para o usuário autenticado
// @access  Private
router.post('/', mealController.createMeal);

// @route   GET /api/meals
// @desc    Obter todas as refeições para o usuário autenticado (opcionalmente por data)
// @access  Private
router.get('/', mealController.getMeals);

// @route   GET /api/meals/:id
// @desc    Obter uma refeição específica pelo ID para o usuário autenticado
// @access  Private
router.get('/:id', mealController.getMeal);

// @route   PUT /api/meals/:id
// @desc    Atualizar uma refeição específica pelo ID para o usuário autenticado
// @access  Private
router.put('/:id', mealController.updateMeal);

// @route   DELETE /api/meals/:id
// @desc    Deletar uma refeição específica pelo ID para o usuário autenticado
// @access  Private
router.delete('/:id', mealController.deleteMeal);

module.exports = router;