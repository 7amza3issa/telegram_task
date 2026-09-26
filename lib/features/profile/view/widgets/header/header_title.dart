import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';

class HeaderTitle extends StatelessWidget {
  final String name;
  final String status;
  final double progress;
  final double curve1;
  final double curve2;
  final double expandedHeight;
  final double collapsedHeight;
  final double screenWidth;
  final double topPadding;
  final bool isDark;

  const HeaderTitle({
    super.key,
    required this.name,
    required this.status,
    required this.progress,
    required this.curve1,
    required this.curve2,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.screenWidth,
    required this.topPadding,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextDirection textDirection = Directionality.of(context);

    final double initialNameSize = ResponsiveBreakpoints.scale(context, 22.0);
    final double collapsedNameSize = ResponsiveBreakpoints.scale(context, 16.0);
    final double currentNameSize = lerpDouble(
      initialNameSize,
      collapsedNameSize,
      progress,
    )!;

    final double initialStatusSize = ResponsiveBreakpoints.scale(context, 14.0);
    final double collapsedStatusSize = ResponsiveBreakpoints.scale(
      context,
      12.0,
    );
    final double currentStatusSize = lerpDouble(
      initialStatusSize,
      collapsedStatusSize,
      progress,
    )!;

    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: name,
        style: TextStyle(
          fontSize: currentNameSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: textDirection,
    )..layout();

    final double nameWidth = textPainter.width;
    final double targetAvatarSize = ResponsiveBreakpoints.scale(context, 75.0);

    final double leftPos1 = ResponsiveBreakpoints.widthPercent(context, 5.0);
    final double leftPos2 = (screenWidth - nameWidth) / 2;
    final double headerLeft = lerpDouble(leftPos1, leftPos2, curve1)!;

    final double topPos1 =
        expandedHeight - ResponsiveBreakpoints.scale(context, 140.0);
    final double topPos2 =
        topPadding +
        targetAvatarSize +
        ResponsiveBreakpoints.scale(context, 16.0);
    final double headerTop = lerpDouble(topPos1, topPos2, curve1)!;

    final double titleOpacity = (1.0 - (curve2 * 2.0)).clamp(0.0, 1.0);

    if (titleOpacity <= 0) return const SizedBox.shrink();

    final Color nameColor = Color.lerp(
      Colors.white,
      theme.textTheme.bodyLarge?.color ?? Colors.black,
      curve1,
    )!;

    final Color statusColor = Color.lerp(
      Colors.white70,
      theme.textTheme.bodySmall?.color ?? Colors.grey,
      curve1,
    )!;

    return Positioned(
      top: headerTop,
      left: headerLeft,
      child: Opacity(
        opacity: titleOpacity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                color: nameColor,
                fontSize: currentNameSize,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
            SizedBox(height: ResponsiveBreakpoints.scale(context, 2.0)),
            Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: currentStatusSize,
                fontWeight: FontWeight.w400,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
