import 'package:flutter/material.dart';

import '../../../constants/constColor.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class CalenderHorizontal extends StatefulWidget {
  const CalenderHorizontal({
    super.key,
    required this.selectedDate,
  });
  final DateTime selectedDate;

  @override
  State<CalenderHorizontal> createState() => _CalenderHorizontalState();
}

class _CalenderHorizontalState extends State<CalenderHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: DatePicker(
        onDateChange: (date) {
          setState(() {
          });
        },

        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: MColor.primary,
        selectedTextColor: Colors.white,
        monthTextStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
        dateTextStyle: const TextStyle(
            fontSize: 20
        ),
        dayTextStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        ),

      ),
    );
  }
}


