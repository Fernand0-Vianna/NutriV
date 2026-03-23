const { mealController } = require('../mealController');

test('should return a meal by ID', () => {
	const meal = mealController.getMealById(1);
	expect(meal).toEqual({ id: 1, name: 'Salada', calories: 150 });
});

test('should add a new meal', () => {
	const newMeal = { name: 'Frango grelhado', calories: 300 };
	const addedMeal = mealController.addMeal(newMeal);
	expect(addedMeal).toEqual(expect.objectContaining(newMeal));
});