import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:flutter/material.dart';


class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(showBackArrows: true,backOnTap: (){},),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
