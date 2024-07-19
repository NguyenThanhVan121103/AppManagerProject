import 'package:appmanager/common_widgets/custom_shape/widgets/imageContainer/imageContainerWidget.dart';
import 'package:appmanager/features/screen/views/setting/widget/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'overviewNewsWidget.dart';

class newsShort extends StatelessWidget {
  const newsShort({
    super.key,
    required this.imgURl,
    required this.title,
    this.isNetworkImage =false,
    required this.suptitle,
    this.onPressed,
  });

  final String title, suptitle;
  final bool isNetworkImage;
  final String imgURl;
  final Widget? onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>{
        Get.to(onPressed)
      },
      child: overviewNewsWidget(imgURl: imgURl, isNetworkImage: isNetworkImage, title: title, suptitle: suptitle,                        padding: EdgeInsets.symmetric(horizontal: 0),
      ),
    );
  }
}

