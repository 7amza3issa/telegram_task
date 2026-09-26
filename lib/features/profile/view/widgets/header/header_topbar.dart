import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/app/localization/languages/app_keys.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';

class HeaderTopBar extends StatelessWidget {
  final double topPadding;
  final double curve1;
  final double curve2;
  final String name;
  final String status;
  final bool isDark;

  const HeaderTopBar({
    super.key,
    required this.topPadding,
    required this.curve1,
    required this.curve2,
    required this.name,
    required this.status,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final Color defaultColor = isDark ? Colors.white : colorScheme.onSurface;
    final Color primaryColor = colorScheme.onSurface;

    final Color iconColor = curve1 > 0.6 && !isDark
        ? primaryColor
        : defaultColor;
    final Color textColor = curve1 > 0.6 && !isDark
        ? primaryColor
        : defaultColor;
    final Color statusColor = curve1 > 0.6 && !isDark
        ? (textTheme.bodySmall?.color ?? colorScheme.onSurfaceVariant)
        : Colors.white70;

    final double collapsedTextOpacity = curve2;

    return Positioned(
      top: topPadding,
      left: ResponsiveBreakpoints.scale(context, 8.0),
      right: ResponsiveBreakpoints.scale(context, 8.0),
      height: kToolbarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.qr_code_scanner_rounded,
              color: iconColor,
              size: ResponsiveBreakpoints.scale(context, 24.0),
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Opacity(
              opacity: collapsedTextOpacity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontSize: ResponsiveBreakpoints.scale(context, 16.0),
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Text(
                    status,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: ResponsiveBreakpoints.scale(context, 12.0),
                      fontWeight: FontWeight.w400,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert_rounded,
              color: iconColor,
              size: ResponsiveBreakpoints.scale(context, 24.0),
            ),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                ResponsiveBreakpoints.scale(context, 16.0),
              ),
            ),
            onSelected: (String value) {
              switch (value) {
                case AppKeys.changeProfileColor:
                  break;
                case AppKeys.changeUsername:
                  break;
                case AppKeys.copyLinkToProfile:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              _buildPopupMenuItem(
                context: context,
                value: AppKeys.changeProfileColor,
                icon: Icons.palette_outlined,
                textKey: AppKeys.changeProfileColor,
              ),
              _buildPopupMenuItem(
                context: context,
                value: AppKeys.changeUsername,
                icon: Icons.alternate_email_rounded,
                textKey: AppKeys.changeUsername,
              ),
              _buildPopupMenuItem(
                context: context,
                value: AppKeys.copyLinkToProfile,
                icon: Icons.link_rounded,
                textKey: AppKeys.copyLinkToProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem({
    required BuildContext context,
    required String value,
    required IconData icon,
    required String textKey,
  }) {
    final theme = Theme.of(context);
    final Color itemColor =
        theme.textTheme.bodyLarge?.color ?? theme.colorScheme.onSurface;

    return PopupMenuItem<String>(
      value: value,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveBreakpoints.scale(context, 16.0),
        vertical: ResponsiveBreakpoints.scale(context, 4.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: itemColor,
            size: ResponsiveBreakpoints.scale(context, 22.0),
          ),
          SizedBox(width: ResponsiveBreakpoints.scale(context, 12.0)),
          Text(
            textKey.tr,
            style: TextStyle(
              color: itemColor,
              fontSize: ResponsiveBreakpoints.scale(context, 14.0),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
