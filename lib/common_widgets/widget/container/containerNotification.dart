import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../button/buttonDialogNotification.dart';
import 'containerDrag.dart';

class BuildNotificationItem extends StatefulWidget {
  const BuildNotificationItem({super.key,
    required this.doc,
    this.onDismissed,
    required this.isSelected,
  });
  final QueryDocumentSnapshot doc;
  final void Function(DismissDirection)? onDismissed;
  final bool isSelected;

  @override
  State<BuildNotificationItem> createState() => _BuildNotificationItemState();
}

class _BuildNotificationItemState extends State<BuildNotificationItem> {
  late bool isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelected; // Gán giá trị trong initState
  }  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (detail){
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: SizedBox(
        height: 190.h,
        child: Dismissible(
          onDismissed: widget.onDismissed,
          key: ValueKey<String>(widget.doc['id']),
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
                color: isSelect ? Colors.grey : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  iconDaytimeWidget(
                    icon: Iconsax.notification_bing, datetime: widget.doc['dateTime'],
                    iconButton: isSelect ? Icons.check : Icons.person,
                    onPressed: (){},
                  ),
                  SizedBox(height: 8.sp,),
                  const Divider(height: 0),
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.doc['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.doc['body'],
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
      ),
    );
  }
}


class BuildNotificationItem2 extends StatefulWidget {
  const BuildNotificationItem2({super.key,
    this.onDismissed,
    required this.isSelected,
    required this.id,
    required this.title,
    required this.dateTime,
    required this.body,
  });
  final void Function(DismissDirection)? onDismissed;
  final bool isSelected;
  final String id, title,dateTime, body;


  @override
  State<BuildNotificationItem2> createState() => _BuildNotificationItemState2();
}

class _BuildNotificationItemState2 extends State<BuildNotificationItem2> {
  late bool isSelect;

  @override
  void initState() {
    super.initState();
    isSelect = widget.isSelected; // Gán giá trị trong initState
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (detail){
        setState(() {
          isSelect = !isSelect;
        });
      },
      child: SizedBox(
        height: 190.h,
        child: Dismissible(
          onDismissed: widget.onDismissed,
          key: ValueKey<String>(widget.id),
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
                color: isSelect ? Colors.grey : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  iconDaytimeWidget(
                    icon: Iconsax.notification_bing, datetime: widget.dateTime,
                    iconButton: isSelect ? Icons.check : Icons.person,
                    onPressed: (){},
                  ),
                  SizedBox(height: 8.sp,),
                  const Divider(height: 0),
                  Expanded(
                      child: Column(
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.body,
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
      ),
    );
  }
}
