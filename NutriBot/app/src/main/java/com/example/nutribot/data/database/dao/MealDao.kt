package com.example.nutribot.data.database.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import com.example.nutribot.data.database.entity.Meal
import kotlinx.coroutines.flow.Flow

@Dao
interface MealDao {
    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertMeal(meal: Meal)

    @Query("SELECT * FROM meals WHERE userId = :userId AND date >= :startOfDay")
    fun getMealsToday(userId: String, startOfDay: Long): Flow<List<Meal>>

    @Query("SELECT * FROM meals WHERE userId = :userId AND date BETWEEN :startDate AND :endDate")
    fun getMealsBetweenDates(
        userId: String,
        startDate: Long,
        endDate: Long
    ): Flow<List<Meal>>

    @Delete
    suspend fun deleteMeal(meal: Meal)
}
