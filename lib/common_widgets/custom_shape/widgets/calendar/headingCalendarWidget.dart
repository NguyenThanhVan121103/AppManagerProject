import 'package:appmanager/common_widgets/custom_shape/widgets/calendar/todayTextWidget.dart';
import 'package:appmanager/models/demoDB.dart';
import 'package:flutter/material.dart';

import 'buttonAddTaskWidget.dart';

class headingCalendarWidget extends StatelessWidget {
  const headingCalendarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // heading
        dayWidget(today: "July 22, 2024",),
        const buttonAddTaskWidget(),
      ],
    );
  }
}

