import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tornet/core/utils/app_colors.dart';

class AppTheme {
  // Light theme configuration
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
  );

  // Dark theme configuration
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );

  // Update status bar style based on theme mode
  static void updateStatusBarStyle(ThemeMode themeMode) {
    if (themeMode == ThemeMode.light) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Dark icons for light theme
          statusBarBrightness: Brightness.light, // iOS uses opposite
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, // Light icons for dark theme
          statusBarBrightness: Brightness.dark, // iOS uses opposite
        ),
      );
    }
  }
}