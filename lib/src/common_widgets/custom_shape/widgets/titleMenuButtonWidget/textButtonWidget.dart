import 'package:flutter/material.dart';

class textButtonWidget extends StatelessWidget {
  const textButtonWidget({
    super.key,
    required this.colorTitle,
    required this.title
  });

  final Color? colorTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( onTap: () {},
        child: Container(child: Text(title, style: TextStyle(color: colorTitle),),));
  }
}
