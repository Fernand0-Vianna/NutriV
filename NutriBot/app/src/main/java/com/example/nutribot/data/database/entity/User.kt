package com.example.nutribot.data.database.entity

import androidx.room.Entity
import androidx.room.PrimaryKey

@Entity(tableName = "users")
data class User(
    @PrimaryKey val id: String,
    val name: String,
    val email: String,
    val weightGoal: Double,
    val height: Double,
    val dietaryRestrictions: String = "",
    val createdAt: Long = System.currentTimeMillis()
)
