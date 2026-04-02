package com.example.nutribot.data.repository

import com.example.nutribot.data.database.dao.UserDao
import com.example.nutribot.data.database.entity.User
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class UserRepository @Inject constructor(
    private val userDao: UserDao
) {
    fun getUser(userId: String): Flow<User?> {
        return userDao.getUser(userId)
    }

    suspend fun insertUser(user: User) {
        userDao.insertUser(user)
    }

    suspend fun updateUser(user: User) {
        userDao.updateUser(user)
    }
}
