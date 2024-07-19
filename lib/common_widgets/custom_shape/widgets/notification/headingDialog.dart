import 'package:appmanager/common_widgets/custom_shape/widgets/dialog/dialogButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class headingDialog extends StatelessWidget {
  const headingDialog({
    super.key,
    required this.iconButton,
    required this.titleButton1,
    required this.titleButton2,
    required this.titleButton3,
    required this.iconButton1,
    required this.iconButton2,
    required this.iconButton3,

  });

  final IconData iconButton;
  final String titleButton1,titleButton2,titleButton3;
  final IconData iconButton1,iconButton2,iconButton3;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        showDialog(context: context,
            builder: (context) => SimpleDialog(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              children: [
                dialogFunctionWidget(text: titleButton1, iconDialog: iconButton1, ),
                Divider(height: 0,),
                dialogFunctionWidget(text:titleButton2, iconDialog: iconButton2,),
                Divider(height: 0,),
                dialogFunctionWidget(text:titleButton3, iconDialog: iconButton3,),
              ],
            )
        );
      },
      icon: Icon(iconButton),);
  }
}


