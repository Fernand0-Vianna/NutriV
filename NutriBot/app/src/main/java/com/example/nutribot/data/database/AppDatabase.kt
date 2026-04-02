package com.example.nutribot.data.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.nutribot.data.database.dao.MealDao
import com.example.nutribot.data.database.dao.UserDao
import com.example.nutribot.data.database.entity.Meal
import com.example.nutribot.data.database.entity.User

@Database(
    entities = [Meal::class, User::class],
    version = 1,
    exportSchema = false
)
abstract class AppDatabase : RoomDatabase() {
    abstract fun mealDao(): MealDao
    abstract fun userDao(): UserDao

    companion object {
        @Volatile
        private var INSTANCE: AppDatabase? = null

        fun getDatabase(context: Context): AppDatabase {
            return INSTANCE ?: synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    AppDatabase::class.java,
                    "nutribot_database"
                ).build()
                INSTANCE = instance
                instance
            }
        }
    }
}
