import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/data/profile_data.dart';
import 'package:telegram_task/features/profile/controllers/profile_controller.dart';
import 'package:telegram_task/features/profile/view/widgets/video_thumbnail_widget.dart';

class ProfilePostsGrid extends StatelessWidget {
  final List<PostModel> posts;

  const ProfilePostsGrid({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (posts.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Text(
              'No posts yet',
              style: TextStyle(color: theme.disabledColor),
            ),
          ),
        ),
      );
    }

    final controller = Get.find<ProfileController>();

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        final post = posts[index];

        return GestureDetector(
          onTap: () => controller.onPostTap(post, posts),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: theme.colorScheme.surfaceContainerHighest,
                child: post.mediaType == MediaType.image
                    ? Image.asset(
                        post.mediaPath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: theme.cardColor,
                          child: Icon(
                            Icons.image_not_supported,
                            color: theme.disabledColor,
                          ),
                        ),
                      )
                    : VideoPlayerThumbnailWidget(videoPath: post.mediaPath),
              ),
              Positioned(
                bottom: 6,
                left: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        post.mediaType == MediaType.video
                            ? Icons.play_arrow
                            : Icons.remove_red_eye,
                        color: Colors.white,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${post.viewsCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }, childCount: posts.length),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
    );
  }
}
