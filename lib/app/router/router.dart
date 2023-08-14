import 'package:flutter/material.dart';
import 'package:pay7test/app/modules/home/home_page.dart';
import 'package:pay7test/app/router/routes.dart';

class CustomRouter {
  static Map<String, WidgetBuilder> routes = {
    Routes.initial: (_) => const HomePage(),
  };

  static Route<dynamic> onGenerateUnknowedRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('Nenhuma rota definida para ${settings.name}'),
          ),
        );
      },
    );
  }
}
