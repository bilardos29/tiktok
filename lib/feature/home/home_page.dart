import 'package:flutter/material.dart';
import 'package:tiktok/feature/home/model/post_model.dart';
import 'package:tiktok/feature/home/view/post_view.dart';
import 'package:tiktok/feature/profile/user_profile_page.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<VideoPlayerController?> _videoControllers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeControllers();
    _pageController.addListener(_handleScroll);
  }

  void _initializeControllers() async {
    _videoControllers = List.generate(listPost.length, (index) => null);
    _loadController(_currentPage);
  }

  void _loadController(int index) async {
    if (_videoControllers[index] != null) return;

    final controller = VideoPlayerController.networkUrl(
      Uri.parse(listPost[index].videoUrl!),
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
        body: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: listPost.length,
        itemBuilder: (context, index)
        {
          final post = listPost[index];
          final controller = _videoControllers[index];
          return PostView(
            username: post.username!,
            description: post.description!,
            likeNumber: post.totalLike!,
            commentNumber: post.totalComment!,
            bookmarkNumber: post.totalBookmark!,
            shareNumber: post.totalShare!,
            isLike: true,
            isBookmark: true,
            onLike: (){},
            onComment: (){},
            onBookmark: (){},
            onShare: (){},
            controller: controller,
          );
        }),
        UserProfilePage(),
      ],
    ));
  }
}
