package com.example.nutribot.data.network

import com.example.nutribot.data.network.api.GeminiApi
import com.example.nutribot.data.network.api.NutritionixApi
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object RetrofitClient {
    private const val NUTRITIONIX_BASE_URL = "https://trackapi.nutritionix.com/"
    private const val GEMINI_BASE_URL = "https://generativelanguage.googleapis.com/"

    private val loggingInterceptor = HttpLoggingInterceptor().apply {
        level = HttpLoggingInterceptor.Level.BODY
    }

    private val client = OkHttpClient.Builder()
        .addInterceptor(loggingInterceptor)
        .build()

    val nutritionixApi: NutritionixApi by lazy {
        Retrofit.Builder()
            .baseUrl(NUTRITIONIX_BASE_URL)
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(NutritionixApi::class.java)
    }

    val geminiApi: GeminiApi by lazy {
        Retrofit.Builder()
            .baseUrl(GEMINI_BASE_URL)
            .client(client)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(GeminiApi::class.java)
    }
}
