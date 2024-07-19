import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<String> titles = <String>['Schedule', 'Debt', 'Contracts'];
final List<IconData> icons = <IconData>[Iconsax.calendar, Iconsax.money_send , Iconsax.barcode];

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
        itemCount: titles?.length,
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
                  child: Icon(icons[index]),
                ),
                Text(
                  '${titles[index]}',
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
