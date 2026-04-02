package com.example.nutribot.presentation.screens.home

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.nutribot.domain.model.Meal
import com.example.nutribot.presentation.components.MealCard
import com.example.nutribot.presentation.components.NutritionChart

@Composable
fun HomeScreen(
    meals: List<Meal>,
    totalCalories: Double,
    onAddMealClick: () -> Unit,
    onViewHistoryClick: () -> Unit,
    onChatBotClick: () -> Unit
) {
    val totalProtein = meals.sumOf { it.protein }.toFloat()
    val totalCarbs = meals.sumOf { it.carbs }.toFloat()
    val totalFat = meals.sumOf { it.fat }.toFloat()

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Resumo do Dia",
            style = MaterialTheme.typography.headlineMedium
        )

        Text(
            text = "${totalCalories.toInt()} kcal consumidas",
            style = MaterialTheme.typography.titleMedium
        )

        Spacer(modifier = Modifier.height(16.dp))

        if (totalProtein > 0 || totalCarbs > 0 || totalFat > 0) {
            NutritionChart(
                protein = totalProtein,
                carbs = totalCarbs,
                fat = totalFat
            )
        }

        Spacer(modifier = Modifier.height(16.dp))

        Button(
            onClick = onAddMealClick,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Adicionar Refeição")
        }

        Button(
            onClick = onViewHistoryClick,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Ver Histórico")
        }

        Button(
            onClick = onChatBotClick,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("ChatBot Nutricional")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = "Refeições de Hoje",
            style = MaterialTheme.typography.titleMedium
        )

        LazyColumn {
            items(meals) { meal ->
                MealCard(meal = meal)
            }
        }
    }
}
