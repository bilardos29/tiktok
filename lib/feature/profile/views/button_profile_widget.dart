import 'package:flutter/material.dart';
import 'package:tiktok/utils/colors.dart';

class ButtonProfileWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;

  const ButtonProfileWidget({
    required this.buttonText,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 4,
        color: ColorsUtil.lightGrey,
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        onPressed: () {},
        child: Text(buttonText, style: const TextStyle(color: Colors.black)));
  }
}
