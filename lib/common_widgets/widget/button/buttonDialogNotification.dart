import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class iconDaytimeWidget extends StatelessWidget {
  const iconDaytimeWidget({
    super.key,
    required this.icon,
    required this.datetime,
    required this.iconButton,
    this.onPressed,
    this.onTapDialog
  });
  final IconData icon;
  final String datetime;
  final IconData iconButton;
  final void Function()? onPressed, onTapDialog;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black,),
            SizedBox(width: 4.sp,),
            Text(datetime),
          ],
        ),

        SizedBox(width: 10.sp,),
        IconButton(onPressed: onPressed, icon: Icon(iconButton))
      ],
    );
  }
}

