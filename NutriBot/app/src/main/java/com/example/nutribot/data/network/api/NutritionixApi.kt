package com.example.nutribot.data.network.api

import com.example.nutribot.data.network.dto.NutritionResponse
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.http.Query

interface NutritionixApi {
    @GET("v2/natural/nutrients")
    suspend fun getNutritionInfo(
        @Header("x-app-id") appId: String,
        @Header("x-app-key") appKey: String,
        @Query("query") query: String
    ): NutritionResponse
}
