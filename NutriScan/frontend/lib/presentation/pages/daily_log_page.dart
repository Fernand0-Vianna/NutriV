// Daily log page
import 'package:flutter/material.dart';
import 'package:nutriscan_app/core/constants/constants.dart';
import 'package:nutriscan_app/presentation/widgets/bottom_nav_bar.dart'; // Adicione a barra de navegação

class DailyLogPage extends StatelessWidget {
  const DailyLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diário Alimentar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu), // Ícone de menu/hambúrguer
            onPressed: () {
              // Ação do menu
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: 1420 / 2000, // Exemplo: 1420 kcal de uma meta de 2000
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(AppConstants.primaryColor),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1420', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                        Text('KCAL CONSUMIDAS', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMacroCard(context, 'Proteína', '85 g', Colors.red),
                _buildMacroCard(context, 'Carbos', '160 g', Colors.blue),
                _buildMacroCard(context, 'Gorduras', '42 g', Colors.amber),
              ],
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                hintText: 'Pesquisar alimento ou prato...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () {
                    // Abrir câmera para escanear
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),
            _buildMealSection(context, 'Café da Manhã', '342 kcal', [
              _buildFoodItem(context, 'Avocado Toast', '2 fatias de pão integral', '280 kcal', 'assets/avocado_toast.png'),
              _buildFoodItem(context, 'Café com Leite', 'Sem açúcar, 200ml', '62 kcal', 'assets/coffee.png'),
            ]),
            const SizedBox(height: 24),
            _buildMealSection(context, 'Almoço', '685 kcal', [
              _buildFoodItem(context, 'Peito de Frango Grelhado', '150g com brócolis', '410 kcal', 'assets/chicken.png'),
              _buildFoodItem(context, 'Mix de Folhas Verdes', 'Com azeite e sementes', '275 kcal', 'assets/salad_bowl.png'),
            ]),
            const SizedBox(height: 24),
            _buildMealSection(context, 'Lanche da Tarde', '195 kcal', [
              _buildFoodItem(context, 'Banana Prata', '1 unidade média', '105 kcal', 'assets/banana.png'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1), // Índice 1 para Diário
    );
  }

  Widget _buildMacroCard(BuildContext context, String title, String value, Color color) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color)),
        Container(
          height: 4,
          width: 60,
          color: color,
          margin: const EdgeInsets.only(top: 4),
        )
      ],
    );
  }

  Widget _buildMealSection(BuildContext context, String mealType, String totalKcal, List<Widget> foodItems) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(mealType, style: Theme.of(context).textTheme.titleLarge),
            Text(totalKcal, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppConstants.primaryColor)),
          ],
        ),
        const SizedBox(height: 12),
        ...foodItems,
      ],
    );
  }

  Widget _buildFoodItem(BuildContext context, String name, String details, String kcal, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath), // Usar imagens locais
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleMedium),
                  Text(details, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            Text(kcal, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppConstants.primaryColor)),
          ],
        ),
      ),
    );
  }
}