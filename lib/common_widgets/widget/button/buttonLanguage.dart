import 'package:flutter/material.dart';

class ButtonLanguage extends StatelessWidget {
  const ButtonLanguage({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(children: [Expanded(child: Text(title, style: TextStyle(fontSize: 16),)), isSelected ? Icon(Icons.check) : Container()],);
  }
}