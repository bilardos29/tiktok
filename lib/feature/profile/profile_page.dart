import 'package:flutter/material.dart';
import 'package:tiktok/screen/profile/views/likes_widget.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';
import 'views/profile_tab.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
              expandedHeight: 330,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Funcs.spaces(8),
                        const ProfileFrameWidget(
                            initialName: 'B',
                            username: '@userBilardo',
                            screen: PositionEnum.profile),
                        Funcs.spaces(20),
                        const LikesWidget(),
                        Funcs.spaces(8),
                        TextButton(
                            onPressed: () {},
                            child: const Text('link profile here')),
                        Funcs.spaces(16),
                      ],
                    ),
                  ],
                ),
              ),
              bottom: const TabBar(tabs: [
                Tab(icon: Icon(Icons.grid_3x3, color: Colors.black)),
                Tab(icon: Icon(Icons.lock, color: Colors.black)),
                Tab(icon: Icon(Icons.favorite_border, color: Colors.black)),
                Tab(
                    icon:
                        Icon(Icons.bookmark_add_outlined, color: Colors.black)),
                Tab(icon: Icon(Icons.favorite_border, color: Colors.black)),
              ]))
        ],
        body: const TabBarView(
          children: [
            ProfileTabView(),
            ProfileTabView(),
            ProfileTabView(),
            ProfileTabView(),
            ProfileTabView(),
          ],
        ),
      ),
    );
  }
}
