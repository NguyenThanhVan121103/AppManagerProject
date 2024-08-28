import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    this.title,
    this.hintText,
    this.iconButton,
    this.widget,
    this.onPressed,
    this.controller,
    this.fontWeightTitle = FontWeight.bold,
    this.fontSizeTitle = 20,
    this.validator,
    this.obscureText = false,
    this.notReadOnly = true,
    this.showContainer = true,
    this.heightContainer = 52,
    this.expands = false,
    this.maxLines = 1,
    this.minLines = 1
  });
  final String? title;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? iconButton;
  final Widget? widget;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final FontWeight fontWeightTitle;
  final double fontSizeTitle;
  final bool obscureText, notReadOnly, showContainer;
  final double heightContainer;
  final bool expands;
  final int maxLines, minLines;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: showContainer ? EdgeInsets.only(top: 16)  : EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null ? Text("$title", style: TextStyle(
              fontWeight: fontWeightTitle,
              fontSize: fontSizeTitle,
          ),) : SizedBox.shrink(),
          showContainer ? Container(
            height: heightContainer.sp,
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
                    expands: expands ? true : false,
                    maxLines: expands ? null : maxLines,
                    minLines: expands ? null : minLines,
                    readOnly: iconButton!=null && notReadOnly == true ? true : false,
                    autofocus: false,
                    cursorColor: Colors.grey[700],
                    controller: controller,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                        hintText: (hintText),
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
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
                    validator: validator,
                    obscureText: obscureText,
                  ),
                ),
                IconButton(onPressed: onPressed, icon: Icon(iconButton, size: 25.sp,))
              ],
            )
          ) : GestureDetector(
            onTap: onPressed,
            child: TextFormField(
              readOnly: notReadOnly? false : true,
              autofocus: false,
              cursorColor: Colors.grey[700],
              controller: controller,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                  hintText: (hintText),
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500],
                  ),
              ),
              validator: validator,
              obscureText: obscureText,
            ),
          ),

        ],
      ),
    );
  }
}
