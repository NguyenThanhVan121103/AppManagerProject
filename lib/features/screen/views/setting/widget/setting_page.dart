import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/navigationBar/navigationMenu.dart';
import 'package:flutter/material.dart';

class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(showBackArrows: true,backOnTap: navigationMenu(),),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
