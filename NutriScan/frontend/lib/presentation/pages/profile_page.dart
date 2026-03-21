// Profile page
import 'package:flutter/material.dart';
import 'package:nutriscan_app/presentation/widgets/bottom_nav_bar.dart'; // Adicione a barra de navegação

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: const Center(
        child: Text('Conteúdo da tela de Perfil'),
      ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 4), // Índice 4 para Perfil
    );
  }
}