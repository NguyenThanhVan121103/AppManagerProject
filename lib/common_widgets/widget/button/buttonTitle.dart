import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ButtonTitle extends StatelessWidget {
  const ButtonTitle({
    super.key,
    required this.title,
    this.titleButton = "View all",
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
            if(showViewAllButton) GestureDetector( onTap: () {},
                child: Text(AppLocalizations.of(context)!.viewAll, style: TextStyle(color: colorTitle),))
          ],
        )
    );
  }
}



