import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'newsShortWIdget.dart';



class newsHomePage extends StatelessWidget {
  const newsHomePage({
    super.key,
    required this.imgURLs,
    required this.newsTitle,
    required this.supTitle,
    this.onPressed,
  });

  final List imgURLs, newsTitle, supTitle;
  final List? onPressed;


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        for (int i = 0; i < imgURLs.length; i++) newsShort(imgURl: imgURLs[i], title: newsTitle[i], suptitle: supTitle[i], onPressed: onPressed?[i],),
      ], options: CarouselOptions(
        viewportFraction: 0.7
    ),
    );
  }
}
