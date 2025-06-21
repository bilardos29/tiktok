import 'package:flutter/material.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/custom_text.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';
import 'package:video_player/video_player.dart';
import 'button_post_widget.dart';

class PostView extends StatelessWidget {
  final String username;
  final String description;
  final String likeNumber;
  final String commentNumber;
  final String bookmarkNumber;
  final String shareNumber;

  final bool isLike;
  final bool isBookmark;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onBookmark;
  final VoidCallback onShare;

  VideoPlayerController? controller;

  PostView({
    required this.username,
    required this.description,
    required this.likeNumber,
    required this.commentNumber,
    required this.bookmarkNumber,
    required this.shareNumber,
    this.isLike = false,
    this.isBookmark = false,
    required this.onLike,
    required this.onComment,
    required this.onBookmark,
    required this.onShare,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Stack(
        fit: StackFit.expand,
        children: [
          //Post Video
          controller != null && controller!.value.isInitialized
              ? FittedBox(
                fit: BoxFit.fitWidth,
                child: SizedBox(
                  width: controller!.value.size.width,
                  height: controller!.value.size.height,
                  child: VideoPlayer(controller!),
                ),
              )
              : const Center(child: CircularProgressIndicator()),
          //Caption username and description
          Container(
            alignment: const Alignment(-1, 1),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Funcs.spaces(4),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CustomText(
                    text: description,
                    fontSize: 16,
                    textColor: Colors.white,
                    onUserTagPressed: (userId) {
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: const Alignment(1, 1),
            padding: const EdgeInsets.only(right: 8, bottom: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileFrameWidget(
                  image: 'profile_sample.png',
                  size: 46,
                  enums: ProfileEnum.addCenter,
                ),
                Funcs.spaces(12),
                ButtonPostWidget(
                  icons: Icons.favorite,
                  number: likeNumber,
                  isSelected: isLike,
                  onAction: () {},
                ),
                Funcs.spaces(10),
                ButtonPostWidget(
                  imgIcon: 'ic_comment.png',
                  number: commentNumber,
                  onAction: () {},
                ),
                Funcs.spaces(10),
                ButtonPostWidget(
                  icons: Icons.bookmark,
                  number: bookmarkNumber,
                  isSelected: isBookmark,
                  onAction: () {},
                ),
                Funcs.spaces(10),
                ButtonPostWidget(
                  imgIcon: 'ic_share.png',
                  number: shareNumber,
                  onAction: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
