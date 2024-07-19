import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class functionAccountWidget extends StatelessWidget {
  const functionAccountWidget({
    super.key,
    this.onPressed,
    required this.icon,
    this.titleButton,
    this.colorIcon = Colors.black
  });
  final void Function()? onPressed;
  final IconData icon;
  final titleButton;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 400,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5)
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Positioned(left: 20,child: Icon(icon, color: colorIcon,)),
            Positioned(left:60, child: Text(titleButton)),
            Positioned(left: 360,child: Icon(Iconsax.arrow_circle_right)),

          ],
        ),
      ),
    );
  }
}

