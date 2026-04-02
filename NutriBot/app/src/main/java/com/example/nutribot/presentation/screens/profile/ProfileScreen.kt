package com.example.nutribot.presentation.screens.profile

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.nutribot.domain.model.User

@Composable
fun ProfileScreen(
    user: User?,
    onSaveProfile: (String, Double, Double, String) -> Unit,
    onLogout: () -> Unit
) {
    var name by remember { mutableStateOf(user?.name ?: "") }
    var weightGoal by remember { mutableStateOf(user?.weightGoal?.toString() ?: "") }
    var height by remember { mutableStateOf(user?.height?.toString() ?: "") }
    var dietaryRestrictions by remember { mutableStateOf(user?.dietaryRestrictions ?: "") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Text(
            text = "Perfil",
            style = MaterialTheme.typography.headlineMedium,
            modifier = Modifier.padding(bottom = 24.dp)
        )

        OutlinedTextField(
            value = name,
            onValueChange = { name = it },
            label = { Text("Nome") },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(16.dp))

        OutlinedTextField(
            value = weightGoal,
            onValueChange = { weightGoal = it },
            label = { Text("Meta de Peso (kg)") },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(16.dp))

        OutlinedTextField(
            value = height,
            onValueChange = { height = it },
            label = { Text("Altura (cm)") },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(16.dp))

        OutlinedTextField(
            value = dietaryRestrictions,
            onValueChange = { dietaryRestrictions = it },
            label = { Text("Restrições Alimentares") },
            modifier = Modifier.fillMaxWidth()
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = {
                val weight = weightGoal.toDoubleOrNull() ?: 0.0
                val h = height.toDoubleOrNull() ?: 0.0
                onSaveProfile(name, weight, h, dietaryRestrictions)
            },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Salvar")
        }

        Button(
            onClick = onLogout,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Sair")
        }
    }
}
