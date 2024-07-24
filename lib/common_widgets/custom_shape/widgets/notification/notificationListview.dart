import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.all(8.sp),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorListView,
            ),
            child: Column(
              children: [
                iconDaytimeWidget(icon: Iconsax.notification_bing, datetime: '3:12 PM, 7/18/2024', iconButton: Icons.adaptive.more),
                SizedBox(height: 8.sp),
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

