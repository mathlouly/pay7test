import 'package:flutter/material.dart';
import 'package:pay7test/app/configs/styles/app_color_style.dart';

class AppTheme {
  static get themeData => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // TextTheme
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: AppColors.black),
          displayMedium: TextStyle(color: AppColors.black),
          displaySmall: TextStyle(color: AppColors.black),
          headlineLarge: TextStyle(color: AppColors.black),
          headlineMedium: TextStyle(color: AppColors.black),
          headlineSmall: TextStyle(color: AppColors.black),
          titleLarge: TextStyle(color: AppColors.black),
          titleMedium: TextStyle(color: AppColors.black),
          titleSmall: TextStyle(color: AppColors.black),
          labelLarge: TextStyle(color: AppColors.black),
          labelMedium: TextStyle(color: AppColors.black),
          labelSmall: TextStyle(color: AppColors.black),
          bodyLarge: TextStyle(color: AppColors.black),
          bodyMedium: TextStyle(color: AppColors.black),
          bodySmall: TextStyle(color: AppColors.black),
        ),
      );
}
