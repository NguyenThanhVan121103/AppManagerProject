import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';


class ButtonNews extends StatelessWidget {
  const ButtonNews({
    super.key,
    required this.imgURl,
    required this.title,
    this.isNetworkImage =false,
    required this.suptitle,
    this.onPressed,
    this.imageWidth= 300,
    this.imageHeight = 150,
    this.borderRadius = 12,
    required this.padding ,
  });

  final String title, suptitle;
  final bool isNetworkImage;
  final String imgURl;
  final Widget? onPressed;
  final double imageHeight, imageWidth, borderRadius;
  final EdgeInsets padding;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>{
        Get.to(onPressed)
      },
      child:SizedBox(
        width: MediaQuery.of(context).size.width*0.6,
        child: Padding(
          padding:  padding,
          child: Column(
            children: [
              ImageContainerWidget(imgURl: imgURl,isNetworkImage: false, height: imageHeight.sp, width: imageWidth.sp,borderRadius: borderRadius.sp,),
              Text(
                title,
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    overflow: TextOverflow.ellipsis
                ),
              ),
              Text(
                suptitle,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.ellipsis
                ),
              )
            ],
          ),
        ),
      )
     );
  }
}

