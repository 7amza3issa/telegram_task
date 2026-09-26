import 'package:flutter/material.dart';
import 'package:telegram_task/core/themes/app_colors.dart';

ThemeData get darkThemeData {
  const String fontFamily = 'Tajawal';
  const List<String> fontFallback = ['Roboto'];

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: fontFamily,
    fontFamilyFallback: fontFallback,
    primaryColor: AppColors.primaryCyan,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkSurface,
    disabledColor: AppColors.darkTextSecondary,
    dividerColor: AppColors.darkDivider,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryCyan,
      secondary: AppColors.onlineCyan,
      surface: AppColors.darkSurface,
      surfaceContainerHighest: AppColors.darkCardButton,
      onPrimary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.darkTextPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
      titleTextStyle: TextStyle(
        fontFamily: fontFamily,
        color: AppColors.darkTextPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedItemColor: AppColors.primaryCyan,
      unselectedItemColor: AppColors.darkIconInactive,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      iconColor: AppColors.darkIconInactive,
      textColor: AppColors.darkTextPrimary,
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: 1,
      space: 0,
    ),
  );
}
