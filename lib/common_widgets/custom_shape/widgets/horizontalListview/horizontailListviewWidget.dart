import 'package:appmanager/models/demoDB.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class horizontalListViewWideget extends StatelessWidget {
  const horizontalListViewWideget({
    super.key,
    this.color = Colors.white,
    this.colorTitle = Colors.white,
  });
  final Color color,colorTitle;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 76,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dataMenu.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: Column(
              children: [
                Container(
                  height: 56,
                  width: 56,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(dataMenu[index].icons),
                ),
                Text(
                  dataMenu[index].titles,
                  style: TextStyle(
                    color: colorTitle,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
