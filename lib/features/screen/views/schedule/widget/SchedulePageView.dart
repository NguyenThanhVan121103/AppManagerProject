import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/news/buttonNewsWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/searchBar/searchPageWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/features/screen/views/news/widget/newsDemoPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class schedulePageView extends StatefulWidget {
  const schedulePageView({super.key});

  @override
  State<schedulePageView> createState() => _schedulePageViewState();
}

class _schedulePageViewState extends State<schedulePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        colorIcon: MColor.third,
        backgroundColor: MColor.primary,
        title: Row(
          children: [
            Text("Garbage collection schedule", style: TextStyle(fontWeight: FontWeight.bold, color: MColor.third), ),
          ],
        ),
      ) ,
      body: Container(

      )
    );
  }
}
