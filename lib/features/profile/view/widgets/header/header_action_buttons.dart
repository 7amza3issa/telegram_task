import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';

class HeaderActionButtons extends StatelessWidget {
  final double curve1;
  final bool isDark;
  final VoidCallback onSetPhoto;
  final VoidCallback onEditInfo;
  final VoidCallback onSettings;

  const HeaderActionButtons({
    super.key,
    required this.curve1,
    required this.isDark,
    required this.onSetPhoto,
    required this.onEditInfo,
    required this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final double buttonsOpacity = (1.0 - (curve1 * 2.0)).clamp(0.0, 1.0);
    if (buttonsOpacity <= 0) return const SizedBox.shrink();

    return Positioned(
      left: ResponsiveBreakpoints.widthPercent(context, 4),
      right: ResponsiveBreakpoints.widthPercent(context, 4),
      bottom: ResponsiveBreakpoints.scale(context, 12),
      child: Opacity(
        opacity: buttonsOpacity,
        child: Row(
          children: [
            _buildBtn(
              context,
              Icons.add_a_photo_outlined,
              'Set Photo'.tr,
              onSetPhoto,
            ),
            SizedBox(width: ResponsiveBreakpoints.scale(context, 10)),
            _buildBtn(context, Icons.edit_outlined, 'Edit Info'.tr, onEditInfo),
            SizedBox(width: ResponsiveBreakpoints.scale(context, 10)),
            _buildBtn(
              context,
              Icons.settings_outlined,
              'Settings'.tr,
              onSettings,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBtn(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    final Color buttonBg = theme.colorScheme.surfaceContainerHighest;
    final Color contentColor = theme.textTheme.bodyLarge?.color ?? Colors.white;

    return Expanded(
      child: Material(
        color: buttonBg.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(
          ResponsiveBreakpoints.scale(context, 16),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            ResponsiveBreakpoints.scale(context, 16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: ResponsiveBreakpoints.scale(context, 12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  color: contentColor,
                  size: ResponsiveBreakpoints.scale(context, 22),
                ),
                SizedBox(height: ResponsiveBreakpoints.scale(context, 4)),
                Text(
                  label,
                  style: TextStyle(
                    color: contentColor,
                    fontSize: ResponsiveBreakpoints.scale(context, 12),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
