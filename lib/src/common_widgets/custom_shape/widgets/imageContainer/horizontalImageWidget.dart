import 'package:appmanager/src/constants/constColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../heading/customCircularWidget.dart';
import 'imageContainerWidget.dart';

class horizontalImage extends StatelessWidget {
  const horizontalImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: const[
            imageContainerWidget(imgURl: "assets/images/1000x500.png",),
            imageContainerWidget(imgURl: "assets/images/1000x500.png",),
            imageContainerWidget(imgURl: "assets/images/1000x500.png",),
          ], options: CarouselOptions(
          viewportFraction: 1,
          onPageChanged: (index, _) => controller.updatePageIndicator(index),
        ),
        ),
        SizedBox(height: 8),
        Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < 3; i++ )CircularContainer(
                height: 4, width: 20, margin: EdgeInsets.only(left: 8),
                backgroundColor: controller.CurrentIndex.value == i ? MColor.primary : Colors.lightBlueAccent ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final CurrentIndex = 0.obs;

  void updatePageIndicator(index) {
    CurrentIndex.value = index;
  }
}
