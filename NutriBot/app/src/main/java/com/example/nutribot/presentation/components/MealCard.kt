package com.example.nutribot.presentation.components

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Card
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.nutribot.domain.model.Meal

@Composable
fun MealCard(
    meal: Meal,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(8.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = meal.name,
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = "${meal.quantity}g - ${meal.calories.toInt()} kcal",
                style = MaterialTheme.typography.bodyMedium
            )
            Row {
                Text(
                    text = "P: ${meal.protein.toInt()}g ",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = "C: ${meal.carbs.toInt()}g ",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    text = "G: ${meal.fat.toInt()}g",
                    style = MaterialTheme.typography.bodySmall
                )
            }
        }
    }
}
