import 'package:flutter/material.dart';
import 'package:todo/core/global/theme/app_colors/app_colors_light.dart';

ThemeData get getThemeDataLight => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColorsLight.primaryColor,
      ),
      scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColorsLight.appBarForegroundColor,
        backgroundColor: AppColorsLight.appBarBackgroundColor,
        centerTitle: true,
      ),
      iconTheme: const IconThemeData(),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      textTheme: const TextTheme(),
      cardTheme: const CardTheme(
        color: AppColorsLight.cardBackgroundColor,
      ),
    );
