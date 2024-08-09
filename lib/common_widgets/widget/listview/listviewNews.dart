import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../button/buttonNews.dart';

class ListviewNews extends StatelessWidget {
  const ListviewNews({
    super.key, this.onPressed,

  });

  final  Widget? onPressed;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return ButtonNews(
            imgURl: "assets/images/1000x500.png",
            title: "This is the heading of the Post ${index} and it ís really big. With a maximum number of lines of two.",
            suptitle: "This is the content of article no ${index}. The summary will be written here with a maximum of three lines.",
            borderRadius: 0,
            imageHeight: 200.sp,
            imageWidth: 1000.sp,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            onPressed:  onPressed
        );
      },
      itemCount: 20,
    );
  }
}

//