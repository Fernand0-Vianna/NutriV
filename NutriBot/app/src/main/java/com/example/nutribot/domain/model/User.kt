package com.example.nutribot.domain.model

data class User(
    val id: String,
    val name: String,
    val email: String,
    val weightGoal: Double,
    val height: Double,
    val dietaryRestrictions: String,
    val createdAt: Long
)
