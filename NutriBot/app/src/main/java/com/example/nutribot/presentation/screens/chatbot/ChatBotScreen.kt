package com.example.nutribot.presentation.screens.chatbot

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.Button
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateListOf
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.example.nutribot.presentation.components.ChatBubble

@Composable
fun ChatBotScreen(
    onSendMessage: (String) -> String
) {
    var userInput by remember { mutableStateOf("") }
    val messages = remember { mutableStateListOf<Pair<String, Boolean>>() }

    Column(
        modifier = Modifier.fillMaxSize()
    ) {
        LazyColumn(
            modifier = Modifier
                .weight(1f)
                .fillMaxWidth()
                .padding(8.dp)
        ) {
            items(messages) { (message, isUser) ->
                ChatBubble(message = message, isUser = isUser)
            }
        }

        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            OutlinedTextField(
                value = userInput,
                onValueChange = { userInput = it },
                label = { Text("Digite sua mensagem...") },
                modifier = Modifier.fillMaxWidth()
            )

            Button(
                onClick = {
                    if (userInput.isNotBlank()) {
                        messages.add(userInput to true)
                        val response = onSendMessage(userInput)
                        messages.add(response to false)
                        userInput = ""
                    }
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Enviar")
            }
        }
    }
}
