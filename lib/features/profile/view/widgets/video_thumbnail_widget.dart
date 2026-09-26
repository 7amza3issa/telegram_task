import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/features/profile/controllers/video_thumnail_controller.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerThumbnailWidget extends StatelessWidget {
  final String videoPath;

  const VideoPlayerThumbnailWidget({super.key, required this.videoPath});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoPlayerThumbnailController>(
      init: VideoPlayerThumbnailController(videoPath),
      tag: videoPath,
      builder: (controller) {
        if (!controller.isInitialized) {
          return Container(
            color: Colors.black87,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white54,
                ),
              ),
            ),
          );
        }

        return SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: controller.videoPlayerController.value.size.width,
              height: controller.videoPlayerController.value.size.height,
              child: VideoPlayer(controller.videoPlayerController),
            ),
          ),
        );
      },
    );
  }
}
