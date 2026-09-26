import 'package:get/get.dart';
import 'package:telegram_task/features/main_navigations/controllers/main_navigation_controller.dart';

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationController>(() => MainNavigationController());
  }
}
