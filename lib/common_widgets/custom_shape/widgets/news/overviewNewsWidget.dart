import 'package:appmanager/common_widgets/custom_shape/widgets/imageContainer/imageContainerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class overviewNewsWidget extends StatelessWidget {
  const overviewNewsWidget({
    super.key,
    required this.imgURl,
    this.isNetworkImage = false,
    required this.title,
    required this.suptitle,
    this.imageWidth= 300,
    this.imageHeight = 150,
    this.borderRadius = 40,
    required this.padding ,
  });

  final String imgURl;
  final bool isNetworkImage;
  final String title;
  final String suptitle;
  final double imageHeight, imageWidth, borderRadius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  padding,
      child: Column(
        children: [
          imageContainerWidget(imgURl: imgURl,isNetworkImage: false, height: imageHeight.sp, width: imageWidth.sp,borderRadius: borderRadius.sp,),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              overflow: TextOverflow.ellipsis
            ),
          ),
          Text(
            suptitle,
            maxLines: 3,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                overflow: TextOverflow.ellipsis

            ),
          )
        ],
      ),
    );
  }
}

