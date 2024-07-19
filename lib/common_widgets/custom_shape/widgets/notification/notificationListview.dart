import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'iconDateTimeWidget.dart';
import 'notificationContentWidget.dart';

class notificationListWidget extends StatelessWidget {
  const notificationListWidget({
    super.key,
    required this.index,
    required this.colorListView
  });

  final int index;
  final Color colorListView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 108,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorListView,
            ),
            child: Column(
              children: [
                iconDaytimeWidget(icon: Iconsax.notification_bing, datetime: '3:12 PM, 7/18/2024', iconButton: Icons.adaptive.more),
                SizedBox(height: 8,),
                Divider(height: 0,),
                notificationContentWiget(title: "Notification", supTitle: "This is body notificaiton", index: index,)
              ],
            ),
          ),
        );
      },
      itemCount: index,

    );
  }
}

