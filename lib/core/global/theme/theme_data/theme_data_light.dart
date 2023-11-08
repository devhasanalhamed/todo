import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/core/global/theme/app_colors/app_colors_light.dart';

ThemeData get getThemeDataLight => ThemeData(
      useMaterial3: true,
      // primarySwatch: AppColorsLight.primaryColor,
      colorScheme: const ColorScheme.light(
        primary: AppColorsLight.primaryColor,
      ),
      //SCAFFOLD THEME
      scaffoldBackgroundColor: AppColorsLight.scaffoldBackgroundColor,
      //APP BAR THEME
      appBarTheme: const AppBarTheme(
        foregroundColor: AppColorsLight.appBarForegroundColor,
        backgroundColor: AppColorsLight.appBarBackgroundColor,
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorsLight.statusBarColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      //ICON THEME
      iconTheme: const IconThemeData(
        color: AppColorsLight.iconColor,
      ),
      //FLOATING ACTION BUTTON THEME
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColorsLight.iconColor,
      ),
      //TEXT THEME
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: AppColorsLight.primaryTextColor,
        ),
      ),
      //CARD THEME
      cardTheme: const CardTheme(
        color: AppColorsLight.cardBackgroundColor,
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      //
    );
