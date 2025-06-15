import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiktok/utils/function_utils.dart';
import 'package:tiktok/widgets/profile_frame_widget.dart';
import 'views/notification_widget.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            //List Profile live
            Container(
                height: 120,
                margin: const EdgeInsets.only(bottom: 4),
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const Padding(
                        padding: EdgeInsets.only(right: 4, left: 4),
                        child: ProfileFrameWidget(
                          initialName: 'B',
                          enums: ProfileEnum.add,
                          username: 'bilardoSitumorang',
                          screen: PositionEnum.inbox,
                        ));
                  },
                )),
            const Divider(height: 1),
            const NotificationWidget(
              username: 'Pengikut Baru',
              initial: 'PB',
              note: 'Savira Dwika mulai mengikutimu',
              enums: ActionEnum.arrow,
            ),
            const NotificationWidget(
              username: 'Aktifitas',
              initial: 'SD',
              note: 'Savira Dwika mulai mengikutimu',
              enums: ActionEnum.arrow,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const NotificationWidget(
                    username: 'Savira Dwika',
                    initial: 'SD',
                    note: 'Ucapkan salam kepada Savira Dwika',
                    enums: ActionEnum.hello,
                  );
                }),
            Container(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  children: [
                    const Text('Saran akun',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Funcs.spaces(4),
                    Icon(
                      Icons.info_outline,
                      size: 14,
                      color: Colors.grey[700],
                    )
                  ],
                )),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const NotificationWidget(initial: 'BS', username: 'Bilardo', note: 'Dari kontak Anda');
                })
            //List Inbox
            //List contact advise
          ],
        ),
      ),
    );
  }
}
