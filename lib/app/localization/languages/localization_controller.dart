import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale currentLocale = Get.deviceLocale ?? const Locale('ar');
  bool get isArabic => currentLocale.languageCode == 'ar';

  void changeLanguage(String languageCode) {
    if (currentLocale.languageCode == languageCode) return;

    currentLocale = Locale(languageCode);
    Get.updateLocale(currentLocale);
    update();
  }

  void toggleLanguage() {
    if (isArabic) {
      changeLanguage('en');
    } else {
      changeLanguage('ar');
    }
  }
}
