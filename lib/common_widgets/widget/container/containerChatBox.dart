import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(width: 260,child: Text(title, style: TextStyle(fontWeight: FontWeight.bold),)),
      Icon(Iconsax.arrow_right_3, size: 14,),
    ],);
  }
}
