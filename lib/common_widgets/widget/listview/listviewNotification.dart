import 'package:appmanager/database/notification_DB/notification_DB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../button/buttonDialogNotification.dart';

class ListviewNotification extends StatefulWidget {
  const ListviewNotification({
    super.key,
    required this.index,
    required this.colorListView
  });

  final int index;
  final Color colorListView;

  @override
  State<ListviewNotification> createState() => _ListviewNotificationState();
}

class _ListviewNotificationState extends State<ListviewNotification> {
  late List<bool> pressedAttentions = notificationData.map((e) => false).toList();



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final pressAttention = pressedAttentions[index];
        return Padding(
          padding: EdgeInsets.all(8.sp),
          child: GestureDetector(
            onTap: (){},
            onLongPressStart: (_) => setState(() {
              pressedAttentions[index] = !pressAttention;
            }),
            // onLongPressEnd: (_) => setState(() {
            //   pressedAttentions[index] = !pressAttention;
            // }),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.sp),
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: pressAttention ? Colors.grey : Colors.white,
              ),
              child: Column(
                children: [
                  iconDaytimeWidget(icon: Iconsax.notification_bing, datetime: notificationData[index].time, iconButton: pressAttention ?  Icons.check : Icons.person),
                  SizedBox(height: 8.sp),
                  Divider(height: 0,),
                  Expanded(
                    child: Column(
                      children: [
                        Text(notificationData[index].title, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20.sp), maxLines: 1, overflow: TextOverflow.ellipsis,),
                        Text(notificationData[index].suptitle, style: TextStyle(fontSize: 16.sp), maxLines: 3, overflow: TextOverflow.ellipsis),
                      ],
                    ),
            )
                ],
              ),
            ),
          ),
        );
      },
      itemCount: notificationData.length,

    );
  }
}

