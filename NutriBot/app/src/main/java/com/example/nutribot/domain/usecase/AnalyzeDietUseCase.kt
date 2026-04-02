package com.example.nutribot.domain.usecase

import com.example.nutribot.data.network.RetrofitClient
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class AnalyzeDietUseCase @Inject constructor() {
    suspend operator fun invoke(dietData: String, apiKey: String): Result<String> {
        return try {
            val request = mapOf(
                "contents" to listOf(
                    mapOf(
                        "parts" to listOf(
                            mapOf("text" to "Analyze this diet and provide recommendations: $dietData")
                        )
                    )
                )
            )
            val response = RetrofitClient.geminiApi.generateContent(apiKey, request)
            val text = response.candidates.firstOrNull()?.content?.parts?.firstOrNull()?.text
            if (text != null) {
                Result.success(text)
            } else {
                Result.failure(Exception("No response from Gemini"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
