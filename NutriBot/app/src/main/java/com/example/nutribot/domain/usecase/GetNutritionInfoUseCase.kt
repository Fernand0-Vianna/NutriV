package com.example.nutribot.domain.usecase

import com.example.nutribot.data.network.RetrofitClient
import com.example.nutribot.data.network.dto.FoodItem
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class GetNutritionInfoUseCase @Inject constructor() {
    suspend operator fun invoke(query: String, appId: String, appKey: String): Result<FoodItem> {
        return try {
            val response = RetrofitClient.nutritionixApi.getNutritionInfo(appId, appKey, query)
            if (response.foods.isNotEmpty()) {
                Result.success(response.foods.first())
            } else {
                Result.failure(Exception("No food found"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
