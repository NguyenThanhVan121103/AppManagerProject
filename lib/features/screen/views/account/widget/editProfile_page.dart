import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
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
      appBar: const MAppBar(iconColor: MColor.primary,showBackArrows: true,),
        body: Container(color: Colors.lightBlueAccent, child: const Center(child: Text("Edit here")),));
  }
}
