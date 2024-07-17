import 'package:appmanager/src/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/navigationBar/navigationMenu.dart';
import 'package:appmanager/src/features/screen/views/home/widget/home_page.dart';
import 'package:flutter/material.dart';

class schedulePageView extends StatelessWidget {
  const schedulePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(showBackArrows: true,backOnTap: navigationMenu(),),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
