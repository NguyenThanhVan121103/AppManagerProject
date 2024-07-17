import 'package:appmanager/src/common_widgets/custom_shape/widgets/imageContainer/imageContainerWidget.dart';
import 'package:appmanager/src/features/screen/views/setting_page/widget/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            imageContainerWidget(imgURl: imgURl,isNetworkImage: isNetworkImage, height: 130, width: 300,borderRadius: 40,),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              suptitle,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}

