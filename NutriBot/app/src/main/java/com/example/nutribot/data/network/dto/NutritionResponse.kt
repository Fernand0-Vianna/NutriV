package com.example.nutribot.data.network.dto

data class NutritionResponse(
    val foods: List<FoodItem>
)

data class FoodItem(
    val food_name: String,
    val serving_qty: Double,
    val serving_unit: String,
    val nf_calories: Double,
    val nf_protein: Double,
    val nf_total_carbohydrate: Double,
    val nf_total_fat: Double
)
