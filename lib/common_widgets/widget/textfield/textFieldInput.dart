import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    required this.title,
    this.hintText,
    this.iconButton,
    this.widget,
    this.onPressed,
    this.controller,
    this.fontWeightTitle = FontWeight.bold,
    this.fontSizeTitle = 20,
  });
  final String title;
  final String? hintText;
  final IconData? iconButton;
  final Widget? widget;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final FontWeight fontWeightTitle;
  final double fontSizeTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
              fontWeight: fontWeightTitle,
              fontSize: fontSizeTitle,
          ),),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12)
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: iconButton!=null ? true : false,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style:  const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        hintText: (hintText),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500],
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0
                            )
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: context.theme.backgroundColor,
                                width: 0
                            )
                        )
                    ),
                  ),
                ),
                IconButton(onPressed: onPressed, icon: Icon(iconButton))
              ],
            )
          ),
        ],
      ),
    );
  }
}
