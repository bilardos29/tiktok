import 'package:flutter/material.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';
import 'button_post_widget.dart';

class PostView extends StatelessWidget {
  final String username;
  final String description;
  final String tag;
  final String likeNumber;
  final String commentNumber;
  final String bookmarkNumber;
  final String shareNumber;

  const PostView(
      {required this.username,
      required this.description,
      required this.tag,
      required this.likeNumber,
      required this.commentNumber,
      required this.bookmarkNumber,
      required this.shareNumber,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[600],
      child: Stack(
        children: [
          //Post Video

          //Caption username and description
          Container(
            alignment: const Alignment(-1, 1),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                RichText(
                    text: TextSpan(
                        style: const TextStyle(color: Colors.white),
                        children: [
                      TextSpan(text: description),
                      TextSpan(
                          text: tag,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
          ),
          Container(
            alignment: const Alignment(1, 1),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ProfileFrameWidget(
                  image: 'profile_sample.png',
                  size: 40,
                  enums: ProfileEnum.addCenter,
                ),
                Funcs.spaces(12),
                ButtonPostWidget(
                  icons: Icons.favorite,
                  number: likeNumber,
                ),
                Funcs.spaces(12),
                ButtonPostWidget(
                  imgIcon: 'ic_comment.png',
                  number: commentNumber,
                ),
                Funcs.spaces(12),
                ButtonPostWidget(
                  icons: Icons.bookmark,
                  number: bookmarkNumber,
                ),
                Funcs.spaces(12),
                ButtonPostWidget(
                  imgIcon: 'ic_share.png',
                  number: shareNumber,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
