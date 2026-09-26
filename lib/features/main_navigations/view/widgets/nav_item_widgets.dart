import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';
import 'package:telegram_task/features/main_navigations/controllers/main_navigation_controller.dart';

class NavItemWidget extends StatelessWidget {
  final MainNavigationController controller;
  final int index;
  final String labelKey;
  final IconData icon;
  final IconData selectedIcon;
  final int badgeCount;
  final bool isProfile;
  final String? profileImageUrl;

  const NavItemWidget({
    super.key,
    required this.controller,
    required this.index,
    required this.labelKey,
    required this.icon,
    required this.selectedIcon,
    this.badgeCount = 0,
    this.isProfile = false,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.currentIndex == index;
    final theme = Theme.of(context);

    final activeColor = theme.colorScheme.primary;
    final inactiveColor = Colors.white70;

    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changePage(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: ResponsiveBreakpoints.scale(context, 8),
            horizontal: ResponsiveBreakpoints.scale(context, 4),
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  if (isProfile)
                    CircleAvatar(
                      radius: ResponsiveBreakpoints.scale(context, 13),
                      backgroundImage: profileImageUrl != null
                          ? AssetImage(profileImageUrl!)
                          : const AssetImage(
                              'assets/images/profile_avatar.gif',
                            ),
                    )
                  else
                    Icon(
                      isSelected ? selectedIcon : icon,
                      color: isSelected ? activeColor : inactiveColor,
                      size: ResponsiveBreakpoints.scale(context, 22),
                    ),

                  if (badgeCount > 0)
                    Positioned(
                      top: -4,
                      right: -8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Center(
                          child: Text(
                            '$badgeCount',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: ResponsiveBreakpoints.scale(
                                context,
                                10,
                              ),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                labelKey.tr,
                style: TextStyle(
                  color: isSelected ? activeColor : inactiveColor,
                  fontSize: ResponsiveBreakpoints.scale(context, 11),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
