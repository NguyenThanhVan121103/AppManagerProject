import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/button/dialogButtonWidget.dart';
class HeadingDialog extends StatelessWidget {
  const HeadingDialog({
    super.key,
    required this.iconButton,
    required this.titleButton1,
    required this.titleButton2,
    required this.titleButton3,
    required this.iconButton1,
    required this.iconButton2,
    required this.iconButton3,
    this.onTap1,
    this.onTap2,
    this.onTap3,

  });

  final IconData iconButton;
  final String titleButton1,titleButton2,titleButton3;
  final IconData iconButton1,iconButton2,iconButton3;
  final void Function()? onTap1, onTap2, onTap3;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        showDialog(context: context,
            builder: (context) => SimpleDialog(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.all(8),
              children: [
                DialogFunctionWidget(text: titleButton1, iconDialog: iconButton1, onTapDialog: onTap1, ),
                Divider(height: 0,),
                DialogFunctionWidget(text:titleButton2, iconDialog: iconButton2, onTapDialog: onTap2,),
                Divider(height: 0,),
                DialogFunctionWidget(text:titleButton3, iconDialog: iconButton3, onTapDialog: onTap3,),
              ],
            )
        );
      },
      icon: Icon(iconButton),);
  }
}


