import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class dialogFunctionWidget extends StatelessWidget {
  const dialogFunctionWidget({
    super.key,
    required this.text,
    required this.iconDialog,
    this.onTapDialog,
  });
  final String text;
  final IconData iconDialog;
  final void Function()? onTapDialog;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDialog,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(iconDialog),
                SizedBox(width: 10,),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Icon(Iconsax.arrow_circle_right)
          ],
        ),
      ),
    );
  }
}

