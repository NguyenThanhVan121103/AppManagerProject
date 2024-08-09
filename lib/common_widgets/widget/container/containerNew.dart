import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerNew extends StatelessWidget {
  const ContainerNew({
    super.key,
    this.crossAxisCount =  2,
    this.mainAxisSpacing= 10,
    this.crossAxisSpacing= 3,
    this.childAspectRatio= 1,
    this.itemCount = 6
  });

  final int crossAxisCount, itemCount;
  final double mainAxisSpacing, crossAxisSpacing, childAspectRatio;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemBuilder: (BuildContext context, index){
        return Container(
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
              const Image(image: AssetImage(
                "assets/images/900x600.png",
              )),
              Spacer(),
              Text(
                "This is the heading of the Post $index and it ís really big. With a maximum number of lines of two.",
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    overflow: TextOverflow.ellipsis
                ),
              ),
              Text(
                "This is the content of article no $index. The summary will be written here with a maximum of three lines.",
                maxLines: 3,
                style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.normal,
                    overflow: TextOverflow.ellipsis
                ),
              )
            ],
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
