import 'package:appmanager/src/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/custom_shape/widgets/navigationBar/navigationMenu.dart';

class newsPageView extends StatelessWidget {
  const newsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MAppBar(showBackArrows: true,backOnTap: navigationMenu(),),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
