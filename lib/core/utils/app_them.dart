import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tornet/core/utils/app_colors.dart';

class AppTheme {
  // Light theme configuration
  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.lightBackground,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor, brightness: Brightness.light),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0),
    textTheme: ThemeData.light().textTheme.apply(fontFamily: 'Chakra Petch'),
    primaryTextTheme: ThemeData.light().primaryTextTheme.apply(fontFamily: 'Chakra Petch'),
  );

  // Dark theme configuration
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor, brightness: Brightness.dark),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.background, foregroundColor: Colors.white, elevation: 0),
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Chakra Petch'),
    primaryTextTheme: ThemeData.dark().primaryTextTheme.apply(fontFamily: 'Chakra Petch'),
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
