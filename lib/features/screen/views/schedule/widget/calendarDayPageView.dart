import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/calendar/headingCalendarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/calendar/listViewCalendarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';

class calendarPageView extends StatefulWidget {
  const calendarPageView({super.key});

  @override
  State<calendarPageView> createState() => _calendarPageViewState();
}

class _calendarPageViewState extends State<calendarPageView> {
  DateTime today = DateTime.now();
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
      ),
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            //heading
            const headingCalendarWidget(),

            //day of the week

            SizedBox(
              height: 150,
              child: listViewCalendarWidget(),
            )
        ]
      )
    )
    );
  }
}

