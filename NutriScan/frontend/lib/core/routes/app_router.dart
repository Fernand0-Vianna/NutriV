// App router configuration
// Definição de rotas do aplicativo (ex: com GoRouter ou Navigator 2.0)
import 'package:flutter/material.dart';
import 'package:nutriscan_app/presentation/pages/home_page.dart';
import 'package:nutriscan_app/presentation/pages/daily_log_page.dart';
import 'package:nutriscan_app/presentation/pages/capture_page.dart';
import 'package:nutriscan_app/presentation/pages/profile_page.dart';
import 'package:nutriscan_app/presentation/pages/archives_page.dart';


class AppRouter {
  static const String homeRoute = '/';
  static const String dailyLogRoute = '/daily-log';
  static const String captureRoute = '/capture';
  static const String archivesRoute = '/archives';
  static const String profileRoute = '/profile';

  static Map<String, WidgetBuilder> routes = {
    homeRoute: (context) => const HomePage(),
    dailyLogRoute: (context) => const DailyLogPage(),
    captureRoute: (context) => const CapturePage(),
    archivesRoute: (context) => const ArchivesPage(),
    profileRoute: (context) => const ProfilePage(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case dailyLogRoute:
        return MaterialPageRoute(builder: (_) => const DailyLogPage());
      case captureRoute:
        return MaterialPageRoute(builder: (_) => const CapturePage());
      case archivesRoute:
        return MaterialPageRoute(builder: (_) => const ArchivesPage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const Text('Erro: Rota não encontrada!'));
    }
  }
}