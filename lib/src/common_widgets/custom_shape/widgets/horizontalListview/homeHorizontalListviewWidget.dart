import 'package:appmanager/src/features/screen/views/schedule/widget/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'horizontailListviewWidget.dart';

final List<String> title = <String>['Schedule', 'Debt', 'Contracts'];
final List<IconData> icon = <IconData>[Iconsax.calendar, Iconsax.money_tick, Iconsax.paperclip];
final List<Function> onTaps = <Function>[];

class homeHorizontalListviewWidget extends StatelessWidget {
  const homeHorizontalListviewWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator?.push(
              context,
              MaterialPageRoute(builder: (context) => const schedulePageView()));
        },
        child: const horizontalListViewWideget(
        )
    );
  }
}
