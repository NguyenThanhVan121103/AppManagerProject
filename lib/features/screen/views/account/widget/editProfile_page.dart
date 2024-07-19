import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';

class editProfilePageView extends StatefulWidget {
  const editProfilePageView({super.key});

  @override
  State<editProfilePageView> createState() => _editProfilePageViewState();
}

class _editProfilePageViewState extends State<editProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(colorIcon: MColor.primary,showBackArrows: true,),
        body: Container(color: Colors.lightBlueAccent, child: Center(child: const Text("Edit here")),));
  }
}
