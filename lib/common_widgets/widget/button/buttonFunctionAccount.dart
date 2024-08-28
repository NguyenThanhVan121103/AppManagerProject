import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FunctionAccountWidget extends StatelessWidget {
  const FunctionAccountWidget({
    super.key,
    this.onPressed,
    this.icon,
    this.titleButton,
    this.colorIcon = Colors.black,
    this.backgroundColor = Colors.grey,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final titleButton;
  final Color colorIcon, backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
            color: backgroundColor,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(left: 20,child: icon != null ? Icon(icon, color: colorIcon,) : SizedBox.shrink()),
            Positioned(left: icon != null ? 60 : 20, child: Text(titleButton)),
            Positioned(left: 360,child: icon != null ? Icon(Iconsax.arrow_circle_right): SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}

