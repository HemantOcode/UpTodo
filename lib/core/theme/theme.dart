// lib/core/theme.dart

import 'package:flutter/material.dart';

class AppColors {
  static const Color primarybtn = Color(0xFF8685E7);
  static const Color background = Color(0xFF121212);
  static const Color text = Colors.white;
  static const Color error = Colors.redAccent;
  static const Color border = Color(0xFF979797);
  static const Color transparent = Colors.transparent;
  static const Color tilebg = Color(0xFF363636);
}

class AppFontSizes {
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double heading = 24.0;
}

class AppFonts {
  static const String primaryFont = 'Schyler'; // 📌 Declare in pubspec.yaml
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppFonts.primaryFont,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primarybtn,
        surface: AppColors.background,
        onPrimary: AppColors.text,
        error: AppColors.error,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          fontSize: AppFontSizes.medium,
          color: AppColors.text,
        ),
        titleLarge: TextStyle(
          fontSize: AppFontSizes.heading,
          fontWeight: FontWeight.bold,
          color: AppColors.text,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.green),
      ),
      dialogTheme: DialogThemeData(backgroundColor: AppColors.tilebg),
    );
  }
}
