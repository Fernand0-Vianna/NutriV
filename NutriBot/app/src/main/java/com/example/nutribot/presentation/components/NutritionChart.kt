package com.example.nutribot.presentation.components

import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import com.github.mikephil.charting.charts.PieChart
import com.github.mikephil.charting.data.PieData
import com.github.mikephil.charting.data.PieDataSet
import com.github.mikephil.charting.data.PieEntry

@Composable
fun NutritionChart(
    protein: Float,
    carbs: Float,
    fat: Float,
    modifier: Modifier = Modifier
) {
    AndroidView(
        modifier = modifier
            .fillMaxWidth()
            .height(200.dp),
        factory = { context ->
            PieChart(context).apply {
                description.isEnabled = false
                isDrawHoleEnabled = true
                holeRadius = 40f
                setUsePercentValues(true)
            }
        },
        update = { chart ->
            val entries = listOf(
                PieEntry(protein, "Proteína"),
                PieEntry(carbs, "Carboidratos"),
                PieEntry(fat, "Gordura")
            )
            val dataSet = PieDataSet(entries, "Nutrientes")
            dataSet.colors = listOf(
                android.graphics.Color.rgb(255, 99, 71),
                android.graphics.Color.rgb(60, 179, 113),
                android.graphics.Color.rgb(255, 215, 0)
            )
            chart.data = PieData(dataSet)
            chart.invalidate()
        }
    )
}
