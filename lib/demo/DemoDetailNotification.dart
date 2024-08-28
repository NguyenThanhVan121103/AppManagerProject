import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class DemoDetailNotification extends StatefulWidget {
  const DemoDetailNotification({super.key, required this.info});
  final String info;

  @override
  State<DemoDetailNotification> createState() => _DemoDetailNotificationState();
}

class _DemoDetailNotificationState extends State<DemoDetailNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        showBackArrows: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(widget.info),
      ),

    );
  }
}
