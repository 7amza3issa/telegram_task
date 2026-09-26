import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';
import 'package:telegram_task/features/main_navigations/controllers/main_navigation_controller.dart';
import 'package:telegram_task/features/main_navigations/view/widgets/nav_item_widgets.dart';
import 'package:telegram_task/features/profile/view/screens/profile_screen.dart';

class MainNavigationScreen extends GetView<MainNavigationController> {
  const MainNavigationScreen({super.key});

  static final List<Widget> pages = [
    const Scaffold(body: Center(child: Text('Chats'))),
    const Scaffold(body: Center(child: Text('Contacts'))),
    const Scaffold(body: Center(child: Text('Settings'))),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Scaffold(
      extendBody: true,
      body: GetBuilder<MainNavigationController>(
        builder: (controller) {
          return IndexedStack(index: controller.currentIndex, children: pages);
        },
      ),
      bottomNavigationBar: GetBuilder<MainNavigationController>(
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveBreakpoints.scale(context, 16),
                vertical: ResponsiveBreakpoints.scale(context, 8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.currentIndex == 3) ...[
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.scale(context, 20),
                          vertical: ResponsiveBreakpoints.scale(context, 10),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.white,
                              size: ResponsiveBreakpoints.scale(context, 20),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Add a post'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: ResponsiveBreakpoints.scale(
                                  context,
                                  14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],

                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveBreakpoints.scale(context, 8),
                          vertical: ResponsiveBreakpoints.scale(context, 6),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2B32)
                              .withValues(alpha: 0.8), // لون شبه شفاف
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NavItemWidget(
                              controller: controller,
                              index: 0,
                              labelKey: 'Chats',
                              icon: Icons.chat_bubble_outline_rounded,
                              selectedIcon: Icons.chat_bubble_rounded,
                              badgeCount: 3,
                            ),
                            NavItemWidget(
                              controller: controller,
                              index: 1,
                              labelKey: 'Contacts',
                              icon: Icons.account_circle_outlined,
                              selectedIcon: Icons.account_circle,
                            ),
                            NavItemWidget(
                              controller: controller,
                              index: 2,
                              labelKey: 'Settings',
                              icon: Icons.settings_outlined,
                              selectedIcon: Icons.settings,
                            ),
                            NavItemWidget(
                              controller: controller,
                              index: 3,
                              labelKey: 'Profile',
                              icon: Icons.person_outline,
                              selectedIcon: Icons.person,
                              isProfile: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
