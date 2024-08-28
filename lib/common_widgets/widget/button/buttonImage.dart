import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';

class ButtonImage extends StatelessWidget {
  const ButtonImage({
    super.key,
    required this.srcImg,
    required this.title,
    this.onTap,
  });
  final void Function()? onTap;
  final String srcImg, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:90.w,
        height:90.h,
        decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black),
              bottom: BorderSide(color: Colors.black),
              right: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black),
            ),
            borderRadius: BorderRadius.circular(12)
        ),
        child: ImageContainerWidget(imgURl: srcImg, width:50, height: 50,),
      ),
    );
  }
}
