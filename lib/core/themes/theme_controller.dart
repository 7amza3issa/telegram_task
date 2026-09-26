import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;
  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    Get.changeThemeMode(_isDarkMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  void setThemeMode(bool isDark) {
    if (_isDarkMode == isDark) return;
    _isDarkMode = isDark;
    Get.changeThemeMode(_isDarkMode ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
