import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_task/data/profile_data.dart';
import 'package:video_player/video_player.dart';

class PostViewerScreen extends StatefulWidget {
  final List<PostModel> posts;
  final int initialIndex;

  const PostViewerScreen({
    super.key,
    required this.posts,
    required this.initialIndex,
  });

  @override
  State<PostViewerScreen> createState() => _PostViewerScreenState();
}

class _PostViewerScreenState extends State<PostViewerScreen> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // 1. عرض المحتوى (صور أو فيديوهات)
            PageView.builder(
              controller: _pageController,
              itemCount: widget.posts.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final post = widget.posts[index];
                if (post.mediaType == MediaType.image) {
                  return _ImagePostItem(imagePath: post.mediaPath);
                } else {
                  return _VideoPostItem(videoPath: post.mediaPath);
                }
              },
            ),

            // 2. الشريط العلوي (زر الإغلاق + العداد)
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    '${_currentIndex + 1} / ${widget.posts.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // إحصائية المشاهدات
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.posts[_currentIndex].viewsCount}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الـ Widget الخاص بعرض الصورة مع دعم التكبير والتصغير (Zoom)
class _ImagePostItem extends StatelessWidget {
  final String imagePath;

  const _ImagePostItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 0.8,
      maxScale: 3.0,
      child: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, color: Colors.white54, size: 64),
        ),
      ),
    );
  }
}

// الـ Widget الخاص بتشغيل الفيديو
class _VideoPostItem extends StatefulWidget {
  final String videoPath;

  const _VideoPostItem({required this.videoPath});

  @override
  State<_VideoPostItem> createState() => _VideoPostItemState();
}

class _VideoPostItemState extends State<_VideoPostItem> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _videoController.setLooping(true);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator(color: Colors.cyan));
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _videoController.value.isPlaying
              ? _videoController.pause()
              : _videoController.play();
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
          if (!_videoController.value.isPlaying)
            Container(
              decoration: const BoxDecoration(
                color: Colors.black45,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 48,
              ),
            ),
        ],
      ),
    );
  }
}
