import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.fawn),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
  static ThemeData get lightMode => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
            background: AppColors.white,
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
            background: AppColors.black,
            primary: AppColors.asparagus,
            secondary: AppColors.grey,
            tertiary: AppColors.white),
        appBarTheme: const AppBarTheme(color: AppColors.asparagus),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
}
