import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.fawn),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
  static ThemeData get lightMode => ThemeData(
        unselectedWidgetColor: AppColors.grey,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
            surface: AppColors.white,
            primary: AppColors.asparagus,
            secondary: AppColors.white,
            tertiary: AppColors.black),
        appBarTheme: const AppBarTheme(color: AppColors.asparagus),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
  static ThemeData get darkMode => ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
            surface: AppColors.blackBackground,
            primary: AppColors.asparagus,
            secondary: AppColors.grey,
            tertiary: AppColors.white),
        appBarTheme: const AppBarTheme(color: AppColors.asparagus),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
}
