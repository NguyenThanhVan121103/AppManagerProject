import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final List<String> titles = <String>['Schedule', 'Debt', 'Contracts'];
final List<IconData> icons = <IconData>[Iconsax.calendar, Iconsax.money_send , Iconsax.barcode];

class horizontalListViewWideget extends StatelessWidget {
  const horizontalListViewWideget({
    super.key,

  });

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
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(icons[index]),
                ),
                Text(
                  '${titles[index]}',
                  style: TextStyle(
                    color: Colors.white,
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
