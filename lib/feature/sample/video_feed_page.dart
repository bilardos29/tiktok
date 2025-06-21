import 'package:flutter/material.dart';
import 'package:tiktok/widgets/custom_text.dart';
import 'package:video_player/video_player.dart';

class VideoFeedPage extends StatefulWidget {
  const VideoFeedPage({super.key});

  @override
  State<VideoFeedPage> createState() => _VideoFeedPageState();
}

class _VideoFeedPageState extends State<VideoFeedPage> {
  final List<Map<String, String>> videos = [
    {
      "username": "GTV Videos",
      "caption": "Big Buck Bunny",
      "description":
          "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license\nhttp://www.bigbuckbunny.org",
      "video_url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    },
    {
      "username": "catlover_123",
      "caption": "Elephant Dream",
      "description": "The first Blender Open Movie from 2006",
      "video_url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    },
    {
      "username": "nature_snap",
      "caption": "or Bigger Blazes",
      "description": "c",
      "video_url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    },
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<VideoPlayerController?> _videoControllers = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _pageController.addListener(_handleScroll);
  }

  void _initializeControllers() async {
    _videoControllers = List.generate(videos.length, (index) => null);
    _loadController(_currentPage);
  }

  void _loadController(int index) async {
    if (_videoControllers[index] != null) return;

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videos[index]['video_url']!),
    );
    controller.initialize().then((_) {
      if (index == _currentPage) {
        controller.play();
      }
      setState(() {});
    });

    _videoControllers[index] = controller;
  }

  void _disposeController(int index) {
    _videoControllers[index]?.pause();
    _videoControllers[index]?.dispose();
    _videoControllers[index] = null;
  }

  void _handleScroll() {
    final next = _pageController.page?.round() ?? 0;
    if (next != _currentPage) {
      _disposeController(_currentPage);
      _currentPage = next;
      _loadController(_currentPage);
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller?.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          final controller = _videoControllers[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              controller != null && controller.value.isInitialized
                  ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  )
                  : const Center(child: CircularProgressIndicator()),
              Positioned(
                left: 16,
                bottom: 64,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Hey @12345#bilardo#. It's time to #123#StopWar#!",
                      parentText: 'ABG',
                      parentTextStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      fontSize: 14,
                      textColor: Colors.white,
                      onUserTagPressed: (userId) {
                        //typically, you'd navigate to details screen
                        //and fetch user details with userId
                        debugPrint(userId);
                      },
                    ),
                    Text(
                      '@${video['username']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      video['caption']!,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
