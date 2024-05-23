import 'package:app_financeiro/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';


class AppThemeData {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.fawn),
        fontFamily: 'Roboto',
        useMaterial3: true,
      );
}

