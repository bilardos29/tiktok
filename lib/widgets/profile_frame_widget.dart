import 'package:flutter/material.dart';

import '../utils/function_utils.dart';

enum ProfileEnum {
  normal,
  live,
  active,
  add,
  addCenter,
}

enum PositionEnum {
  inbox,
  profile,
  home,
}

class ProfileFrameWidget extends StatelessWidget {
  final double size;
  final String? initialName;
  final String? image;
  final String? username;
  final ProfileEnum enums;
  final PositionEnum screen;

  const ProfileFrameWidget({
    this.size = 84,
    this.initialName,
    this.image,
    this.username,
    this.enums = ProfileEnum.normal,
    this.screen = PositionEnum.home,
    Key? key,
  }) : super(key: key);

  bool get isLive => enums == ProfileEnum.live;

  bool get isNormal => enums == ProfileEnum.normal;

  bool get isActive => enums == ProfileEnum.active;

  bool get isAdd => enums == ProfileEnum.add;

  bool get isAddCenter => enums == ProfileEnum.addCenter;

  bool get isHome => screen == PositionEnum.home;

  bool get isInbox => screen == PositionEnum.inbox;

  bool get isProfile => screen == PositionEnum.profile;

  Color get colors => isActive
      ? Colors.green
      : isAdd || isAddCenter
          ? Colors.lightBlueAccent
          : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment:
              isAddCenter ? Alignment.bottomCenter : Alignment.bottomRight,
          children: [
            Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: isHome ? Colors.white : Colors.deepOrange,
                borderRadius: BorderRadius.circular(size),
                border: Border.all(
                    width: 2,
                    color: isLive ? Colors.redAccent : Colors.transparent),
              ),
              child: Funcs.isValueNull(initialName)
                  ? Container(
                      width: size,
                      height: size,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size),
                          image: DecorationImage(
                              image: AssetImage('images/$image'),
                              fit: BoxFit.contain)),
                    )
                  : Text(
                      initialName!,
                      style: TextStyle(
                          fontSize: size / 2,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ), //dummy image profile_sample.png
            ),
            isNormal
                ? const SizedBox()
                : isAddCenter
                    ? Container(
                        width: size / 2,
                        height: size / 2,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(size / 2),
                            border: Border.all(width: 6, color: Colors.red)),
                        child: Image.asset(
                          'images/ic_add2.png',
                          color: Colors.white,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(size / 3),
                        ),
                        child: Container(
                            width: size / 3,
                            height: size / 3,
                            decoration: BoxDecoration(
                                color: colors,
                                borderRadius: BorderRadius.circular(size / 3),
                                border: Border.all(width: 6, color: colors)),
                            child: isActive
                                ? const SizedBox()
                                : Image.asset(
                                    color: Colors.white,
                                    fit: BoxFit.contain,
                                    isAdd
                                        ? 'images/ic_add2.png'
                                        : isLive
                                            ? 'images/ic_live.png'
                                            : '')),
                      ),
          ],
        ),
        SizedBox(height: Funcs.isValueNull(username) ? 5 : 0),
        Funcs.isValueNull(username)
            ? const SizedBox()
            : SizedBox(
                width: isProfile ? double.infinity : size,
                child: Text(
                  username!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: isProfile ? 18 : 12,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              )
      ],
    );
  }
}
