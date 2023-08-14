import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pay7test/app/configs/styles/app_theme_style.dart';
import 'package:pay7test/app/router/router.dart';
import 'package:pay7test/app/router/routes.dart';

class Pay7TestApp extends StatelessWidget {
  const Pay7TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '7Pay Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      routes: CustomRouter.routes,
      initialRoute: Routes.initial,
      builder: (context, child) => child!,
    );
  }
}
