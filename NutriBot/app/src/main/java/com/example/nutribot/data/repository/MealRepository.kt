package com.example.nutribot.data.repository

import com.example.nutribot.data.database.dao.MealDao
import com.example.nutribot.data.database.entity.Meal
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MealRepository @Inject constructor(
    private val mealDao: MealDao
) {
    fun getMealsToday(userId: String, startOfDay: Long): Flow<List<Meal>> {
        return mealDao.getMealsToday(userId, startOfDay)
    }

    fun getMealsBetweenDates(userId: String, startDate: Long, endDate: Long): Flow<List<Meal>> {
        return mealDao.getMealsBetweenDates(userId, startDate, endDate)
    }

    suspend fun insertMeal(meal: Meal) {
        mealDao.insertMeal(meal)
    }

    suspend fun deleteMeal(meal: Meal) {
        mealDao.deleteMeal(meal)
    }
}
