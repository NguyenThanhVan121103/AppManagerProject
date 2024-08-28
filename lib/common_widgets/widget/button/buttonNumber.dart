import 'package:flutter/material.dart';

class ButtonNumber extends StatelessWidget {
  const ButtonNumber({
    super.key,
    this.isSpecialButton = false,
    this.number = "",
    this.icon,
    this.onTap,
  });
  final String number;
  final bool isSpecialButton;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50, width: 120,
        decoration: BoxDecoration(color:Colors.white, borderRadius: BorderRadius.circular(12)),
        child: isSpecialButton
            ? Icon(icon)
            :Text(number, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
    );
  }
}
