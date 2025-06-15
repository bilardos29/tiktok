import 'package:flutter/material.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';

enum ActionEnum { arrow, notification, hello, follow }

class NotificationWidget extends StatelessWidget {
  final String? image;
  final String? initial;
  final String? username;
  final String? note;
  final int? totalNotif;
  final ActionEnum? enums;

  const NotificationWidget(
      {this.image,
      this.initial,
      this.username,
      this.note,
      this.totalNotif = 4,
      this.enums = ActionEnum.follow,
      Key? key})
      : super(key: key);

  bool get isArrow => enums == ActionEnum.arrow;

  bool get isNotification => enums == ActionEnum.notification;

  bool get isHello => enums == ActionEnum.hello;

  bool get isFollow => enums == ActionEnum.follow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileFrameWidget(
            size: 56,
            enums: ProfileEnum.normal,
            screen: PositionEnum.inbox,
            initialName: initial,
            image: image,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 6, bottom: 12),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(note!, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                isArrow
                    ? const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      )
                    : isNotification
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('11:45 PM',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[500])),
                              Container(
                                height: totalNotif! > 1 ? 16 : 8,
                                width: totalNotif! > 1 ? 20 : 8,
                                margin: EdgeInsets.only(
                                    top: totalNotif! > 1 ? 6 : 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.red),
                                child: totalNotif! > 1
                                    ? const Text('2',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                    : const SizedBox(),
                              ),
                            ],
                          )
                        : isHello
                            ? Container(
                                width: 70,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[200],
                                ),
                                child: Image.asset(
                                  'images/ic_wave.png',
                                  height: 24,
                                  width: 24,
                                ),
                              )
                            : Row(children: [
                                FilledButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.red)),
                                  child: const Text('Ikuti'),
                                ),
                                Funcs.spaces(8),
                                const Icon(Icons.close)
                              ]),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
