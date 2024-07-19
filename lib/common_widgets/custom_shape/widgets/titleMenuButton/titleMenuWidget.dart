import 'package:flutter/material.dart';

import 'textButtonWidget.dart';

class title_buttonWidget extends StatelessWidget {
  const title_buttonWidget({
    super.key,
    required this.title,
    this.titleButton = 'View all',
    this.showViewAllButton =true,
    this.colorTitle,
    this.onPressed,
  });
  final String title, titleButton;
  final Color? colorTitle;
  final bool showViewAllButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(style: TextStyle(color: colorTitle, fontSize: 23, fontWeight: FontWeight.bold), title,),
            if(showViewAllButton) textButtonWidget(title: titleButton, colorTitle: colorTitle)
          ],
        )
    );
  }
}



