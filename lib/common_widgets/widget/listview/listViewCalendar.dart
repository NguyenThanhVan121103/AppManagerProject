import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// DateTime VietNam

final _currentDate = DateTime.now();
final _dayFormat = DateFormat("d");
final _dayOfWeekFormat = DateFormat("E");
final _monthFormat = DateFormat("MMM");

List dateTime() {
  final dates = <Widget>[];
  for (int i = 0; i < 7 ; i++) {
    final date = _currentDate.add(Duration(days: i));
    dates.add(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "${_monthFormat.format(date)}",                          ),
          Text(
            "${_dayFormat.format(date)}",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${_dayOfWeekFormat.format(date)}",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  return dates;


}


// State
class ListViewCalendarWidget extends StatefulWidget {
  const ListViewCalendarWidget({super.key});

  @override
  State<ListViewCalendarWidget> createState() => _ListViewCalendarWidgetState();
}

class _ListViewCalendarWidgetState extends State<ListViewCalendarWidget> {
  bool isPressed = false;
  final dates = dateTime();

  @override

  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 95,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 150,
                decoration: BoxDecoration(
                  // color: MColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  color: isPressed ? MColor.primary : MColor.third,
                ),
                child:dates[index],
              ),
            ),
            onTap: (){
              setState(() {
                isPressed = !isPressed;
              });
            },
          ),
        );
      },
      itemCount: dates.length,
    );
  }
}
