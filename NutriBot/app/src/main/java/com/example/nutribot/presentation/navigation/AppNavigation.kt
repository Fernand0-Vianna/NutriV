package com.example.nutribot.presentation.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import com.example.nutribot.presentation.screens.auth.LoginScreen
import com.example.nutribot.presentation.screens.auth.RegisterScreen
import com.example.nutribot.presentation.screens.chatbot.ChatBotScreen
import com.example.nutribot.presentation.screens.home.HomeScreen
import com.example.nutribot.presentation.screens.meal.AddMealScreen
import com.example.nutribot.presentation.screens.meal.MealHistoryScreen
import com.example.nutribot.presentation.screens.profile.ProfileScreen

sealed class Screen(val route: String) {
    object Login : Screen("login")
    object Register : Screen("register")
    object Home : Screen("home")
    object AddMeal : Screen("add_meal")
    object MealHistory : Screen("meal_history")
    object ChatBot : Screen("chatbot")
    object Profile : Screen("profile")
}

@Composable
fun AppNavigation(
    navController: NavHostController
) {
    NavHost(
        navController = navController,
        startDestination = Screen.Login.route
    ) {
        composable(Screen.Login.route) {
            LoginScreen(
                onLoginClick = { _, _ -> navController.navigate(Screen.Home.route) },
                onRegisterClick = { navController.navigate(Screen.Register.route) }
            )
        }

        composable(Screen.Register.route) {
            RegisterScreen(
                onRegisterClick = { _, _, _ -> navController.navigate(Screen.Home.route) },
                onLoginClick = { navController.navigate(Screen.Login.route) }
            )
        }

        composable(Screen.Home.route) {
            HomeScreen(
                meals = emptyList(),
                totalCalories = 0.0,
                onAddMealClick = { navController.navigate(Screen.AddMeal.route) },
                onViewHistoryClick = { navController.navigate(Screen.MealHistory.route) },
                onChatBotClick = { navController.navigate(Screen.ChatBot.route) }
            )
        }

        composable(Screen.AddMeal.route) {
            AddMealScreen(
                onAddMeal = { _, _ -> navController.popBackStack() },
                onBackClick = { navController.popBackStack() }
            )
        }

        composable(Screen.MealHistory.route) {
            MealHistoryScreen(
                meals = emptyList(),
                onBackClick = { navController.popBackStack() }
            )
        }

        composable(Screen.ChatBot.route) {
            ChatBotScreen(
                onSendMessage = { "Resposta do chatbot" }
            )
        }

        composable(Screen.Profile.route) {
            ProfileScreen(
                user = null,
                onSaveProfile = { _, _, _, _ -> },
                onLogout = { navController.navigate(Screen.Login.route) }
            )
        }
    }
}
