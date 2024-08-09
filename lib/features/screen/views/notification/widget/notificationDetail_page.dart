import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

import '../../../../../constants/constColor.dart';

class NotiPageView extends StatefulWidget {
  const NotiPageView({super.key});

  @override
  State<NotiPageView> createState() => _NotiPageViewState();
}

class _NotiPageViewState extends State<NotiPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        backgroundColor: MColor.primary,
      ),
      body:Container(
        alignment: Alignment.center,
        child: const Text("Content is here", style: TextStyle(fontSize: 60),),
      )
    );
  }
}
