import 'package:flutter/material.dart';
import '../../../../database/news_DB/new_data.dart';
import '../button/buttonNews.dart';





class NewsHomePage extends StatelessWidget {
  const NewsHomePage({
    super.key,
    required this.imgURLs,
    required this.newsTitle,
    required this.supTitle,
    this.onPressed,
    this.scrollDirection = Axis.vertical,
    this.controller,
  });

  final String imgURLs, newsTitle, supTitle;
  final Widget? onPressed;
  final Axis scrollDirection;
  final ScrollController? controller;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        controller: controller,
        scrollDirection: scrollDirection,
        itemBuilder: (BuildContext context, int index) {
          return ButtonNews(imgURl: newsData[index].imgUrls, title: newsData[index].titles, suptitle: newsData[index].supTitle, onPressed: newsData[index].onPressed,padding: const EdgeInsets.symmetric(horizontal: 0));
        },
        itemCount: newsData.length,
      ),
    );
  }
}
