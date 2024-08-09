import 'package:appmanager/features/screen/views/schedule/widget/calendarPage.dart';
import 'package:flutter/material.dart';

import '../../../../database/iconTitle_DB/menu_data.dart';
import '../../../demo/demoCalendar.dart';



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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: menuData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(_, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal:20 ),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => menuData[index].onTap));
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
                    child: Icon(menuData[index].icons),
                  ),
                  Text(
                    menuData[index].titles,
                    style: TextStyle(
                      color: colorTitle,
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
}
