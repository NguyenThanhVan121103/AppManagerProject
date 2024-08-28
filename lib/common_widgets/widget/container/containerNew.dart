import 'package:appmanager/database/news_DB/new_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContainerNew extends StatelessWidget {
  const ContainerNew({
    super.key,
    this.crossAxisCount =  2,
    this.mainAxisSpacing= 10,
    this.crossAxisSpacing= 3,
    this.childAspectRatio= 0.8,
    this.itemCount = 6,
    this.onTap,
  });

  final int crossAxisCount, itemCount;
  final double mainAxisSpacing, crossAxisSpacing, childAspectRatio;
  final Widget? onTap;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemBuilder: (BuildContext context, index){
        return GestureDetector(
          onTap: (){Get.to(newsData[0].onPressed);},
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(color: Colors.white),
                  bottom: BorderSide(color: Colors.white),
                  left: BorderSide(color: Colors.white),
                  right: BorderSide(color: Colors.white),
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(
                  newsData[index].imgUrls
                )),
                Text(
                  newsData[index].titles,
                  maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      overflow: TextOverflow.ellipsis
                  ),
                ),
                Text(
                  newsData[index].supTitle,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.normal,
                      overflow: TextOverflow.ellipsis
                  ),
                ),
                // Spacer(),

              ],
            ),

          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
    ) ,
      itemCount: itemCount,
    );
  }
}
