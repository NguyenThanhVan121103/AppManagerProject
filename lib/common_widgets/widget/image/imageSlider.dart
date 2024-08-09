import 'package:appmanager/constants/constColor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';
import '../heading/customCircular.dart';

class HorizontalSlideImage extends StatelessWidget {
  const HorizontalSlideImage({
    super.key,
    this.backgroundColor = MColor.primary
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: const[
            ImageContainerWidget(imgURl: "assets/images/1000x500.png",),
            ImageContainerWidget(imgURl: "assets/images/1000x500.png",),
            ImageContainerWidget(imgURl: "assets/images/1000x500.png",),
            ImageContainerWidget(imgURl: "assets/images/1000x500.png",),
          ], options: CarouselOptions(
          viewportFraction: 0.8,
          onPageChanged: (index, _) => controller.updatePageIndicator(index),
        ),
        ),
        SizedBox(height: 8),
        Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
            children: [
              for(int i = 0; i < 4; i++ )CircularContainer(
                height: 4, width: controller.CurrentIndex.value == i ? 20 : 4, margin: EdgeInsets.only(left: 8),
                backgroundColor: backgroundColor),
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
