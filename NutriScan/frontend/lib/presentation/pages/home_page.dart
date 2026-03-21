import 'package:flutter/material.dart';
import 'package:nutriscan_app/core/constants/constants.dart';
import 'package:nutriscan_app/core/routes/app_router.dart';
import 'package:nutriscan_app/presentation/widgets/bottom_nav_bar.dart'; // Adicione a barra de navegação

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _message = '';

  void _showHelloWorld() {
    setState(() {
      _message = AppConstants.helloWorldText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriScan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Ação do botão de notificação
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Olá, Marina Lopes
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/profile_pic.png'), // Adicione uma imagem em assets
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Olá, Marina Lopes', style: Theme.of(context).textTheme.headlineSmall),
                    Text('Hoje, 24 de Outubro', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Card Plano Personalizado
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                  image: AssetImage('assets/salad.png'), // Imagem de salada
                  fit: BoxFit.cover,
                  alignment: Alignment.centerRight,
                  opacity: 0.2,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('PLANO PERSONALIZADO', style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 8),
                  Text('Sua Dieta,\nSuas Regras', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Ação para ver detalhes do plano
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppConstants.primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('Ver Detalhes'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Metabolismo
            Text('METABOLISMO', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Taxa Basal', style: TextStyle(fontSize: 14)),
                        const SizedBox(height: 4),
                        Text('1500 kcal', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: 0.7, // 70%
                        strokeWidth: 8,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
                      ),
                      Text('70%', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Diário Alimentar e Meu Treino
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouter.dailyLogRoute);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.restaurant_menu, color: AppConstants.primaryColor, size: 40),
                          const SizedBox(height: 8),
                          const Text('Diário Alimentar', textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.fitness_center, color: AppConstants.accentColor, size: 40),
                        const SizedBox(height: 8),
                        const Text('Meu Treino', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Meta da Semana
            Text('Meta da Semana', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.85, // 85% Completo
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
            ),
            const SizedBox(height: 8),
            Text('Você está a apenas 300 kcal de atingir sua meta calórica semanal. Mantenha o foco!', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),

            // Botão "Escanear Alimentos"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Navegar para a tela de captura da câmera
                  Navigator.pushNamed(context, AppRouter.captureRoute);
                  _showHelloWorld(); // Apenas para demonstrar a funcionalidade do botão original
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('Escanear Alimentos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            if (_message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    _message,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 0), // Índice 0 para Início
    );
  }
}