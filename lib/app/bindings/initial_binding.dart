import 'package:get/get.dart';
import 'package:telegram_task/app/localization/languages/localization_controller.dart';
import 'package:telegram_task/core/themes/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);

    Get.put<LocalizationController>(LocalizationController(), permanent: true);
  }
}
