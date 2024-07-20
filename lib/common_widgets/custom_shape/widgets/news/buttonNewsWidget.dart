import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'overviewNewsWidget.dart';

class buttonNewsWidget extends StatelessWidget {
  const buttonNewsWidget({
    super.key,
    required this.index,
    this.onTap,
  });

  final int index;
  final Widget? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(onTap);
      },
      child: Padding(
          padding: EdgeInsets.all(8),
          child: overviewNewsWidget(
            imgURl: "assets/images/1000x500.png",
            title: "This is the heading of the Post ${index} and it ís really big. With a maximum number of lines of two.",
            suptitle: "This is the content of article no ${index}. The summary will be written here with a maximum of three lines.",
            borderRadius: 0,
            imageHeight: 200.sp,
            imageWidth: 1000.sp,
            padding: EdgeInsets.symmetric(horizontal: 8),
          )
      ),
    );
  }
}
