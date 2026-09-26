import 'package:get/get.dart';

class MainNavigationController extends GetxController {
  int currentIndex = 3;

  void changePage(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      update();
    }
  }
}
