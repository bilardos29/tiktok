import 'package:flutter/material.dart';
import 'package:tiktok/feature/profile/views/likes_widget.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';
import 'views/profile_tab.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet World'),
        centerTitle: true,
      ),
      body: DefaultTabController(
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
                          const ProfileFrameWidget(
                              initialName: 'PW',
                              username: 'Pet World',
                              screen: PositionEnum.profile),
                          Funcs.spaces(14),
                          const LikesWidget(),
                          Funcs.spaces(8),
                          TextButton(
                              onPressed: () {},
                              child: const Text('link profile here')),
                          Funcs.spaces(20),
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
                      icon: Icon(Icons.bookmark_add_outlined,
                          color: Colors.black)),
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
      ),
    );
  }
}
