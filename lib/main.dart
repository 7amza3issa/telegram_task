import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/app/bindings/initial_binding.dart';
import 'package:telegram_task/app/localization/languages/localization_controller.dart';
import 'package:telegram_task/app/routes/app_pages.dart';
import 'package:telegram_task/core/themes/app_theme.dart';
import 'package:telegram_task/core/themes/theme_controller.dart';
import 'package:telegram_task/app/localization/languages/app_translations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<ThemeController>(ThemeController(), permanent: true);
  Get.put<LocalizationController>(LocalizationController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (themeController) {
        return GetBuilder<LocalizationController>(
          builder: (locController) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              initialBinding: InitialBinding(),

              translations: AppTranslations(),
              locale: locController.currentLocale,
              fallbackLocale: const Locale('en'),

              theme: AppTheme.light,
              darkTheme: AppTheme.dark,
              themeMode: themeController.themeMode,

              builder: (context, child) {
                return Directionality(
                  textDirection: locController.isArabic
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: child!,
                );
              },
              initialRoute: AppPages.initial,
              getPages: AppPages.routes,
            );
          },
        );
      },
    );
  }
}
