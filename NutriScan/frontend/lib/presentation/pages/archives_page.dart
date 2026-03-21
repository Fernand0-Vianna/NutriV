import 'package:flutter/material.dart';
import 'package:nutriscan_app/core/constants/constants.dart';
import 'package:nutriscan_app/presentation/widgets/bottom_nav_bar.dart'; // Adicione a barra de navegação
import 'package:fl_chart/fl_chart.dart'; // Importe para gráficos

class ArchivesPage extends StatelessWidget {
  const ArchivesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquivos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Ação de notificação
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFilterButton('Semanal', Colors.grey[300]!, Colors.black),
                _buildFilterButton('Mensal', AppConstants.primaryColor, Colors.white),
                _buildFilterButton('Anual', Colors.grey[300]!, Colors.black),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: _buildInfoCard(context, 'MÉDIA CALÓRICA', '1.840 kcal', Icons.local_fire_department, AppConstants.primaryColor)),
                const SizedBox(width: 16),
                Expanded(child: _buildInfoCard(context, 'TREINOS CONCLUÍDOS', '22', Icons.fitness_center, AppConstants.accentColor)),
              ],
            ),
            const SizedBox(height: 24),
            Text('Tendência de Macros', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildMacroTrendChart(context),
            const SizedBox(height: 24),
            Text('Atividade Física', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildActivityChart(context),
            const SizedBox(height: 24),
            Text('Documentos Recentes', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            _buildDocumentItem(context, 'Bioimpedância_Ago.pdf', 'Enviado em 15 de Ago, 2023'),
            _buildDocumentItem(context, 'Exames_Sangue_Geral.pdf', 'Enviado em 02 de Ago, 2023'),
            _buildDocumentItem(context, 'Plano_Nutricional_V2.pdf', 'Enviado em 28 de Jul, 2023'),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3), // Índice 3 para Arquivos
    );
  }

  Widget _buildFilterButton(String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoCard(BuildContext context, String title, String value, IconData icon, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 30),
          const SizedBox(height: 8),
          Text(title, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMacroTrendChart(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildLegendItem(context, 'PROT', Colors.green),
                const SizedBox(width: 8),
                _buildLegendItem(context, 'CARB', Colors.red),
                const SizedBox(width: 8),
                _buildLegendItem(context, 'GORD', Colors.orange),
              ],
            ),
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(color: Colors.grey, fontSize: 10);
                          Widget text;
                          switch (value.toInt()) {
                            case 0: text = const Text('S1', style: style); break;
                            case 1: text = const Text('S2', style: style); break;
                            case 2: text = const Text('S3', style: style); break;
                            case 3: text = const Text('S4', style: style); break;
                            default: text = const Text('', style: style); break;
                          }
                          return SideTitleWidget(axisSide: meta.axisSide, child: text);
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(showTitles: false),
                    topTitles: AxisTitles(showTitles: false),
                    rightTitles: AxisTitles(showTitles: false),
                  ),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [FlSpot(0, 3), FlSpot(1, 4), FlSpot(2, 3.5), FlSpot(3, 5)],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: const [FlSpot(0, 2), FlSpot(1, 3), FlSpot(2, 2.5), FlSpot(3, 4)],
                      isCurved: true,
                      color: Colors.red,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: const [FlSpot(0, 1), FlSpot(1, 2), FlSpot(2, 1.5), FlSpot(3, 3)],
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, String text, Color color) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(text, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildActivityChart(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 100,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const style = TextStyle(color: Colors.grey, fontSize: 10);
                      Widget text;
                      switch (value.toInt()) {
                        case 0: text = const Text('S', style: style); break;
                        case 1: text = const Text('T', style: style); break;
                        case 2: text = const Text('Q', style: style); break;
                        case 3: text = const Text('Q', style: style); break;
                        case 4: text = const Text('S', style: style); break;
                        case 5: text = const Text('S', style: style); break;
                        case 6: text = const Text('D', style: style); break;
                        default: text = const Text('', style: style); break;
                      }
                      return SideTitleWidget(axisSide: meta.axisSide, child: text);
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: AxisTitles(showTitles: false),
                topTitles: AxisTitles(showTitles: false),
                rightTitles: AxisTitles(showTitles: false),
              ),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8, color: AppConstants.primaryColor.withOpacity(0.6))]),
                BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 12, color: AppConstants.primaryColor.withOpacity(0.6))]),
                BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 6, color: AppConstants.primaryColor.withOpacity(0.6))]),
                BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 10, color: AppConstants.primaryColor.withOpacity(0.6))]),
                BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 18, color: AppConstants.primaryColor)]),
                BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 15, color: AppConstants.primaryColor.withOpacity(0.8))]),
                BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 7, color: AppConstants.primaryColor.withOpacity(0.6))]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDocumentItem(BuildContext context, String fileName, String uploadDate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(Icons.description, color: AppConstants.primaryColor, size: 30),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fileName, style: Theme.of(context).textTheme.titleMedium),
                  Text(uploadDate, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.download_for_offline, color: AppConstants.primaryColor),
              onPressed: () {
                // Ação para baixar o documento
              },
            ),
          ],
        ),
      ),
    );
  }
}