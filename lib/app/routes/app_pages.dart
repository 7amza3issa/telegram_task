import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:telegram_task/features/main_navigations/binding/main_navigation_binding.dart';
import 'package:telegram_task/app/routes/app_routes.dart';
import 'package:telegram_task/features/main_navigations/view/main_navigation_screen.dart';
import 'package:telegram_task/features/profile/bindings/profile_binding.dart';
import 'package:telegram_task/features/profile/view/screens/profile_screen.dart';

class AppPages {
  static const initial = Routes.mainNav;
  static final routes = [
    GetPage(
      name: Routes.mainNav,
      page: () => MainNavigationScreen(),
      binding: MainNavigationBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: Routes.CHATS,
    //   page: () => ChatsScreen(),
    //   binding: ChatBinding(),
    // ),
    // GetPage(
    //   name: Routes.CONTACTS,
    //   page: () => ContactsScreen(),
    //   binding: ContactBinding(),
    // ),
    // GetPage(
    //   name: Routes.SETTINGS,
    //   page: () => SettingsScreen(),
    //   binding: SettingBinding(),
    // ),
  ];
}
