import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData get lightThemeData {
  const String fontFamily = 'Tajawal';
  const List<String> fontFallback = ['Roboto'];

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallback,
    primaryColor: AppColors.primaryCyan,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightSurface,
    disabledColor: AppColors.lightTextSecondary,
    dividerColor: AppColors.lightDivider,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryCyan,
      secondary: AppColors.onlineCyan,
      surface: AppColors.lightSurface,
      surfaceContainerHighest: AppColors.lightBackground,
      onPrimary: Colors.white,
      error: Color(0xFFE53935),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.lightTextPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightTextPrimary),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: AppColors.lightTextPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedItemColor: AppColors.primaryCyan,
      unselectedItemColor: AppColors.lightTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      iconColor: AppColors.lightTextSecondary,
      textColor: AppColors.lightTextPrimary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextPrimary),
      bodyMedium: TextStyle(color: AppColors.lightTextPrimary),
      bodySmall: TextStyle(color: AppColors.lightTextSecondary),
      titleLarge: TextStyle(color: AppColors.lightTextPrimary),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
      space: 0,
    ),
  );
}
