import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';

class HeaderAvatar extends StatelessWidget {
  final double progress;
  final double curve1;
  final double phase2Progress;
  final String? imagePath;
  final double screenWidth;
  final double topPadding;

  const HeaderAvatar({
    super.key,
    required this.progress,
    required this.curve1,
    required this.phase2Progress,
    this.imagePath,
    required this.screenWidth,
    required this.topPadding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double targetAvatarSize = ResponsiveBreakpoints.scale(context, 75.0);
    final double currentAvatarSize = lerpDouble(
      screenWidth,
      targetAvatarSize,
      curve1,
    )!;

    final double avatarTop =
        lerpDouble(
          0.0,
          topPadding + ResponsiveBreakpoints.heightPercent(context, 1.0),
          curve1,
        )! -
        (phase2Progress * ResponsiveBreakpoints.scale(context, 40.0));

    final double avatarLeft = (screenWidth - currentAvatarSize) / 2;
    final double borderRadius = lerpDouble(0.0, currentAvatarSize / 2, curve1)!;
    final double avatarOpacity = (1.0 - (phase2Progress * 2.2)).clamp(0.0, 1.0);
    final double gradientOpacity = (1.0 - (curve1 * 1.5)).clamp(0.0, 1.0);

    if (avatarOpacity <= 0) return const SizedBox.shrink();

    return Positioned(
      top: avatarTop,
      left: avatarLeft,
      width: currentAvatarSize,
      height: currentAvatarSize,
      child: Opacity(
        opacity: avatarOpacity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Stack(
            fit: StackFit.expand,
            children: [
              imagePath != null
                  ? Image.asset(imagePath!, fit: BoxFit.cover)
                  : Container(
                      color: theme.primaryColor,
                      child: Icon(
                        Icons.person,
                        size: ResponsiveBreakpoints.scale(context, 80),
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
              if (gradientOpacity > 0)
                Opacity(
                  opacity: gradientOpacity,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black26,
                          Colors.transparent,
                          Colors.black87,
                        ],
                        stops: [0.0, 0.4, 1.0],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
