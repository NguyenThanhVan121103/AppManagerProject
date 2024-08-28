import 'package:appmanager/features/screen/views/contract/widget/contractPage.dart';
import 'package:appmanager/features/screen/views/schedule/widget/calendarPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../database/iconTitle_DB/menu_data.dart';
import '../../../demo/demoCalendar.dart';
import '../../../features/screen/views/debt/widget/debtPage.dart';



class HorizontalMenuListView extends StatelessWidget {
  const HorizontalMenuListView({
    super.key,
    this.color = Colors.white,
    this.colorTitle = Colors.white,

  });
  final Color color,colorTitle;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 76,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
      padding: const EdgeInsets.symmetric(horizontal:20 ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPageView()));
        },
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
              child: Icon(Iconsax.calendar),
            ),
            Text(
              AppLocalizations.of(context)!.schedule,
              style: TextStyle(
                color: colorTitle,
              ),
            )
          ],
        ),
      ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DebtPageView()));
              },
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
                    child: Icon(Iconsax.money_send,),
                  ),
                  Text(
                    AppLocalizations.of(context)!.debt,
                    style: TextStyle(
                      color: colorTitle,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ContractPageView()));
              },
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
                    child: Icon(Iconsax.barcode),
                  ),
                  Text(
                    AppLocalizations.of(context)!.contracts,
                    style: TextStyle(
                      color: colorTitle,
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
