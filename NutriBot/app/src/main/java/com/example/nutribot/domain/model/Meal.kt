package com.example.nutribot.domain.model

data class Meal(
    val id: Int = 0,
    val name: String,
    val quantity: Int,
    val calories: Double,
    val protein: Double,
    val carbs: Double,
    val fat: Double,
    val date: Long,
    val userId: String
)
