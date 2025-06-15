import 'package:flutter/material.dart';
import 'package:tiktok/feature/home/view/post_view.dart';
import 'package:tiktok/feature/profile/user_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.horizontal,
      children: [
        PageView(
          scrollDirection: Axis.vertical,
          children: const [
            PostView(
              username: 'Pet World',
              description: 'Funny pet playing outside',
              tag: '#fyp #viral #pet',
              likeNumber: '1.2M',
              commentNumber: '1234',
              bookmarkNumber: '12.5K',
              shareNumber: '111',
            ),
            PostView(
              username: 'Secret Keyword',
              description: 'Secret message for 1% people',
              tag: '#fyp #viral #message',
              likeNumber: '1.2M',
              commentNumber: '1234',
              bookmarkNumber: '12.5K',
              shareNumber: '113',
            ),
            PostView(
              username: 'Nationality',
              description: 'Sun will be collapse',
              tag: '#fyp #viral #nationality',
              likeNumber: '1.0M',
              commentNumber: '1234',
              bookmarkNumber: '12.5K',
              shareNumber: '233',
            ),
          ],
        ),
        UserProfilePage(),
      ],
    ));
  }
}
