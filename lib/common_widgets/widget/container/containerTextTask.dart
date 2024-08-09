import 'package:flutter/material.dart';

class containerTextTask extends StatelessWidget {
  const containerTextTask({
    super.key,
    required this.index,
    this.title,
    required this.content,
    this.iconText,
  });

  final int index;
  final String? title;
  final String content;
  final IconData? iconText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          (iconText != null) ? Row(
            children: [
              Icon(iconText),
              Text("${title}:", style: TextStyle(fontSize: 20, fontFamily: "Roboto"),),
            ],
          )
              :  Text("${title}:", style: TextStyle(fontSize: 20, fontFamily: "Roboto"),),
          Text(content, style: TextStyle(
              fontSize: 20,
              fontFamily: "Roboto",
          ),
          ),
        ],
      ),
    );
  }
}
