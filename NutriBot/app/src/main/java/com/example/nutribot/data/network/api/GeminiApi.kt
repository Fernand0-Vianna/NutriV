package com.example.nutribot.data.network.api

import com.example.nutribot.data.network.dto.GeminiResponse
import retrofit2.http.Body
import retrofit2.http.POST
import retrofit2.http.Query

interface GeminiApi {
    @POST("v1beta/models/gemini-pro:generateContent")
    suspend fun generateContent(
        @Query("key") apiKey: String,
        @Body request: Map<String, Any>
    ): GeminiResponse
}
