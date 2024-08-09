import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/database/news_DB/newMenu_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PersistentHeader extends SliverPersistentHeaderDelegate{
  PersistentHeader({required this.currentIndex, this.onTap});
  final int currentIndex;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 86,
      color: MColor.primary,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: newMenuData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: GestureDetector(
              onTap: newMenuData[index].onTap,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 56,
                      width: 56,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: currentIndex == index + 2 ?  Colors.blue : Colors.blue[200],
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: Icon(newMenuData[index].icons, color: Colors.white,),
                    ),
                  ),
                  Text(
                    newMenuData[index].title,
                    style: TextStyle(
                      color: MColor.third,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 86.0;

  @override
  // TODO: implement minExtent
  double get minExtent => 76.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
  
}