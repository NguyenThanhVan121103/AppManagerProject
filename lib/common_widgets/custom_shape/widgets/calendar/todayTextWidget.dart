import 'package:flutter/material.dart';

class dayWidget extends StatelessWidget {
  dayWidget({
    super.key,
    required this.today,
  });
  final String today;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(today, style: TextStyle(fontSize: 15,)),
        Text("Today", style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
