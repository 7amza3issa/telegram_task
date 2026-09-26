import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerThumbnailController extends GetxController {
  final String videoPath;
  late VideoPlayerController videoPlayerController;
  bool isInitialized = false;

  VideoPlayerThumbnailController(this.videoPath);

  @override
  void onInit() {
    super.onInit();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      videoPlayerController = VideoPlayerController.asset(videoPath);

      await videoPlayerController.initialize();

      videoPlayerController.pause();

      isInitialized = true;
      update();
    } catch (e) {
      isInitialized = false;
      update();
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose(); // تنظيف الذاكرة عند الخروج
    super.onClose();
  }
}
