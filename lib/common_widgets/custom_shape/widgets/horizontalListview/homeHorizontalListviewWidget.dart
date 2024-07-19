import 'package:appmanager/features/screen/views/schedule/widget/SchedulePageView.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'horizontailListviewWidget.dart';

final List<String> title = <String>['Schedule', 'Debt', 'Contracts'];
final List<IconData> icon = <IconData>[Iconsax.calendar, Iconsax.money_tick, Iconsax.paperclip];
final List<Function> onTaps = <Function>[];

class homeHorizontalListviewWidget extends StatelessWidget {
  const homeHorizontalListviewWidget({
    super.key,
    this.color = Colors.white,
    this.colorTitle = Colors.white,

  });
  final Color color, colorTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator?.push(
              context,
              MaterialPageRoute(builder: (context) => schedulePageView()));
        },
        child: horizontalListViewWideget(
          color: color,
          colorTitle: colorTitle,
        )
    );
  }
}
