import 'package:flutter/material.dart';
import 'package:tiktok/utils/function_utils.dart';

class ButtonPostWidget extends StatelessWidget {
  final IconData? icons;
  final String? imgIcon;
  final String? number;
  final bool isSelected;
  final VoidCallback onAction;

  const ButtonPostWidget({
    this.icons,
    this.imgIcon,
    this.number,
    this.isSelected = false,
    required this.onAction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onAction,
      child: Column(
        children: [
          imgIcon != null
              ? Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  'images/$imgIcon',
                  width: 32,
                  height: 32,
                  fit: BoxFit.fill,
                  color: isSelected ? Colors.red : Colors.white,
                ),
              )
              : Icon(
                icons,
                color: isSelected ? Colors.red : Colors.white,
                size: 36,
              ),
          Funcs.spaces(1),
          number == null
              ? const SizedBox()
              : Text(
                number ?? '',
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
        ],
      ),
    );
  }
}
