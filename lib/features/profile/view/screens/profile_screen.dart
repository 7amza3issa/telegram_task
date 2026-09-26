import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/core/responsive/responsive_breakpoints.dart';
import 'package:telegram_task/features/profile/controllers/profile_controller.dart';
import 'package:telegram_task/features/profile/view/widgets/header/profile_header_delegate.dart';
import 'package:telegram_task/features/profile/view/widgets/profile_info_section.dart';
import 'package:telegram_task/features/profile/view/widgets/profile_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final double topPadding = MediaQuery.paddingOf(context).top;

    final double expandedHeight = ResponsiveBreakpoints.scale(context, 380.0);
    final double collapsedHeight = kToolbarHeight + topPadding;
    final double scrollDelta = expandedHeight - collapsedHeight;

    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        final user = controller.userProfile;

        return Scaffold(
          backgroundColor: colorScheme.surface,
          body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              controller.handleScrollSnap(notification, scrollDelta);
              return false;
            },
            child: CustomScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProfileHeaderDelegate(
                    name: user.name,
                    status: user.isOnline ? 'online' : 'offline',
                    imagePath: user.profileAvatarPath,
                    onSetPhoto: controller.onSetPhoto,
                    onEditInfo: controller.onEditInfo,
                    onSettings: controller.onSettings,
                    expandedHeight: expandedHeight,
                    collapsedHeight: collapsedHeight,
                  ),
                ),
                SliverToBoxAdapter(
                  child: ProfileInfoSection(
                    phone: user.phoneNumber,
                    username: user.username,
                    bio: user.bio,
                    birthday: user.birthday,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 10)),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _StickyTabBarDelegate(
                    child: Container(
                      color: colorScheme.surface,
                      child: Row(
                        children: [
                          _buildTabButton(
                            context: context,
                            title: 'Posts (${user.posts.length})',
                            isSelected: controller.selectedTabIndex == 0,
                            onTap: () => controller.changeTab(0),
                          ),
                          _buildTabButton(
                            context: context,
                            title: 'Archived (${user.archivedPosts.length})',
                            isSelected: controller.selectedTabIndex == 1,
                            onTap: () => controller.changeTab(1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ProfilePostsGrid(posts: controller.currentPosts),
                const SliverPadding(padding: EdgeInsets.only(bottom: 120)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabButton({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? colorScheme.primary : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyTabBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 48.0;

  @override
  double get minExtent => 48.0;

  @override
  bool shouldRebuild(covariant _StickyTabBarDelegate oldDelegate) => true;
}
