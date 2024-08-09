import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';

class newsDemoPageView extends StatelessWidget {
  const newsDemoPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(
        showBackArrows: true,
        backgroundColor: MColor.primary,
      ),
      body: Center(
        child: Container(
          child: Text('This is News', style: TextStyle(fontSize: 60),),
        ),
      ),
    );
  }
}
