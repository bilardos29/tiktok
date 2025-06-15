import 'package:flutter/material.dart';

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight) / 3.5;
    final double itemWidth = size.width / 3;

    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            color: Colors.grey[500],
          );
        });
  }
}
