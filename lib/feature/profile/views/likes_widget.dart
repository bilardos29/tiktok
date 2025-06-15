import 'package:flutter/material.dart';

import '../../../utils/function_utils.dart';
import '../../sample/view.dart';
import 'button_profile_widget.dart';

class LikesWidget extends StatelessWidget {
  final String followingNumber;
  final String followerNumber;
  final String likesNumber;

  const LikesWidget({
    this.followingNumber = '0',
    this.followerNumber = '0',
    this.likesNumber = '0',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              viewing('58', 'Mengikuti'),
              viewing('12', 'Pengikut'),
              InkWell(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SamplePage()));
              }, child: viewing('112', 'Suka')),
            ],
          ),
          Funcs.spaces(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonProfileWidget(buttonText: 'Edit profil', onClick: () {}),
              Funcs.dividers(12),
              ButtonProfileWidget(onClick: () {}, buttonText: 'Tambahkan teman')
            ],
          )
        ],
      ),
    );
  }

  Widget viewing(String val, String label) {
    return Column(
      children: [
        Text(val,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black))
      ],
    );
  }
}
