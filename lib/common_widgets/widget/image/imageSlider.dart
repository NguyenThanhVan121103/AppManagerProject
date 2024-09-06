import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/database/news_DB/new_data.dart';
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
          items: [
            ImageContainerWidget(imgURl: newsData[0].imgUrls,),
            ImageContainerWidget(imgURl: newsData[1].imgUrls,),
            ImageContainerWidget(imgURl: newsData[2].imgUrls,),
            ImageContainerWidget(imgURl: newsData[3].imgUrls,),
          ], options: CarouselOptions(
          autoPlay: truegir,
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
