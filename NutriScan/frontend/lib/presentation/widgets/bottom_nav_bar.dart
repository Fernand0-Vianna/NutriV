import 'package:flutter/material.dart';
import 'package:nutriscan_app/core/constants/constants.dart';
import 'package:nutriscan_app/core/routes/app_router.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppConstants.primaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed, // Garante que todos os itens são visíveis
      onTap: (index) {
        if (index == currentIndex) return; // Evita recarregar a mesma tela

        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRouter.homeRoute);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRouter.dailyLogRoute);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRouter.captureRoute);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRouter.archivesRoute);
            break;
          case 4:
            Navigator.pushReplacementNamed(context, AppRouter.profileRoute);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Início',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant_menu),
          label: 'Diário',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: 'Capturar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder_open),
          label: 'Arquivos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
    );
  }
}