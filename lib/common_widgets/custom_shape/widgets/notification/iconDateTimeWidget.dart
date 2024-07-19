import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'headingDialog.dart';

class iconDaytimeWidget extends StatelessWidget {
  const iconDaytimeWidget({
    super.key,
    required this.icon,
    required this.datetime,
    required this.iconButton,
    this.onPressed,
    this.onTapDialog
  });
  final IconData icon;
  final String datetime;
  final IconData iconButton;
  final void Function()? onPressed, onTapDialog;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black,),
            const SizedBox(width: 4,),
            Text(datetime),
          ],
        ),
        const SizedBox(width: 10,),
        headingDialog(iconButton: iconButton, titleButton1: "Copy", titleButton2: "Share",titleButton3: "Delete",
          iconButton1: Iconsax.copy,iconButton2: Iconsax.share,iconButton3: Iconsax.trash,)
      ],
    );
  }
}

