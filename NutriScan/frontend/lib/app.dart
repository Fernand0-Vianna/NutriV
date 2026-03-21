import 'package:flutter/material.dart';
import 'package:nutriscan_app/presentation/pages/home_page.dart';
import 'package:nutriscan_app/presentation/theme/app_theme.dart'; // Importe o tema

class NutriScanApp extends StatelessWidget {
  const NutriScanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriScan',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Aplica o tema
      home: const HomePage(), // Tela inicial
    );
  }
}