import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../button/buttonDialogNotification.dart';
import 'containerDrag.dart';

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({super.key, required this.doc, this.onDismissed});
  final QueryDocumentSnapshot doc;
  final void Function(DismissDirection)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Dismissible(
        onDismissed: onDismissed,
        key: ValueKey<String>(doc['id']),
        background: ContainerDrag(
          colorContainer: Colors.red.withOpacity(0.6),
          aligment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          iconFunction: Iconsax.trash,
        ),
        secondaryBackground: ContainerDrag(
          colorContainer: Colors.red.withOpacity(0.6),
          aligment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          iconFunction: Iconsax.trash,        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            height: 190.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                iconDaytimeWidget(
                  icon: Iconsax.notification_bing, datetime: doc['dateTime'],
                  iconButton: Icons.person,
                  onPressed: (){},
                ),
                SizedBox(height: 8.sp,),
                const Divider(height: 0),
                Expanded(
                    child: Column(
                      children: [
                        Text(
                          doc['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          doc['body'],
                          style: TextStyle(fontSize: 16.sp),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
