import 'package:flutter/material.dart';
import 'package:telegram_task/features/profile/view/widgets/header/header_action_buttons.dart';
import 'package:telegram_task/features/profile/view/widgets/header/header_avatar.dart';
import 'package:telegram_task/features/profile/view/widgets/header/header_title.dart';
import 'package:telegram_task/features/profile/view/widgets/header/header_topbar.dart';

class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String name;
  final String status;
  final String? imagePath;
  final VoidCallback onSetPhoto;
  final VoidCallback onEditInfo;
  final VoidCallback onSettings;

  final double expandedHeight;
  final double collapsedHeight;

  ProfileHeaderDelegate({
    required this.name,
    required this.status,
    this.imagePath,
    required this.onSetPhoto,
    required this.onEditInfo,
    required this.onSettings,
    required this.expandedHeight,
    required this.collapsedHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final bool isDark = theme.brightness == Brightness.dark;

    final double maxScroll = maxExtent - minExtent;
    final double progress = maxScroll > 0
        ? (shrinkOffset / maxScroll).clamp(0.0, 1.0)
        : 0.0;

    final double topPadding = MediaQuery.paddingOf(context).top;
    final double screenWidth = MediaQuery.sizeOf(context).width;

    final double phase1Progress = (progress / 0.45).clamp(0.0, 1.0);
    final double phase2Progress = progress <= 0.45
        ? 0.0
        : ((progress - 0.45) / 0.55).clamp(0.0, 1.0);

    final double curve1 = Curves.easeOutCubic.transform(phase1Progress);
    final double curve2 = Curves.easeInOutCubic.transform(phase2Progress);

    final Color headerBgColor = isDark
        ? colorScheme.surface
        : theme.scaffoldBackgroundColor;

    return Container(
      color: headerBgColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          HeaderAvatar(
            progress: progress,
            curve1: curve1,
            phase2Progress: phase2Progress,
            imagePath: imagePath,
            screenWidth: screenWidth,
            topPadding: topPadding,
          ),
          HeaderTitle(
            name: name,
            status: status,
            progress: progress,
            curve1: curve1,
            curve2: curve2,
            expandedHeight: expandedHeight,
            collapsedHeight: collapsedHeight,
            screenWidth: screenWidth,
            topPadding: topPadding,
            isDark: isDark,
          ),
          HeaderTopBar(
            topPadding: topPadding,
            curve1: curve1,
            curve2: curve2,
            name: name,
            status: status,
            isDark: isDark,
          ),
          HeaderActionButtons(
            curve1: curve1,
            isDark: isDark,
            onSetPhoto: onSetPhoto,
            onEditInfo: onEditInfo,
            onSettings: onSettings,
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant ProfileHeaderDelegate oldDelegate) => true;
}
