import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/data/profile_data.dart';
import 'package:telegram_task/features/profile/view/screens/post_viewer_screen.dart';

class ProfileController extends GetxController {
  late UserProfileModel userProfile;
  int selectedTabIndex = 0;

  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    userProfile = UserProfileModel.mock();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void changeTab(int index) {
    selectedTabIndex = index;
    update();
  }

  List<PostModel> get currentPosts {
    return selectedTabIndex == 0
        ? userProfile.posts
        : userProfile.archivedPosts;
  }

  void handleScrollSnap(ScrollNotification notification, double scrollDelta) {
    if (notification is ScrollEndNotification) {
      final double currentOffset = scrollController.offset;

      if (currentOffset > 0 && currentOffset < scrollDelta) {
        if (currentOffset > scrollDelta * 0.45) {
          scrollController.animateTo(
            scrollDelta,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
          );
        } else {
          scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
          );
        }
      }
    }
  }

  void onPostTap(PostModel post, List<PostModel> postsList) {
    int initialIndex = postsList.indexOf(post);

    Get.to(
      () => PostViewerScreen(
        posts: postsList,
        initialIndex: initialIndex < 0 ? 0 : initialIndex,
      ),
      transition: Transition.fadeIn,
    );
  }

  void onSetPhoto() {}

  void onEditInfo() {}

  void onSettings() {}

  void onChangeProfileColor() {}

  void onChangeUsername() {}

  void onCopyProfileLink() {}
}
