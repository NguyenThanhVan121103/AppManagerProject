import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../models/demoDB.dart';
import 'newsShortWIdget.dart';



class newsHomePage extends StatelessWidget {
  const newsHomePage({
    super.key,
    required this.imgURLs,
    required this.newsTitle,
    required this.supTitle,
    this.onPressed,
  });

  final String imgURLs, newsTitle, supTitle;
  final Widget? onPressed;


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < overviewNews.length; i++) newsShort(imgURl: overviewNews[i].imgUrls, title: overviewNews[i].titles, suptitle: overviewNews[i].supTitle, onPressed: overviewNews[i].onPressed,),
      ], options: CarouselOptions(
        viewportFraction: 0.7
    ),
    );
  }
}
