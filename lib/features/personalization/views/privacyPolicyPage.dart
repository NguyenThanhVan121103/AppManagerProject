import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class PrivacyPolicyPageView extends StatefulWidget {
  const PrivacyPolicyPageView({super.key});

  @override
  State<PrivacyPolicyPageView> createState() => _PrivacyPolicyPageViewState();
}

class _PrivacyPolicyPageViewState extends State<PrivacyPolicyPageView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        showBackArrows: true,
        iconColor: Colors.white,
        title: Text("Privacy policy", style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
      ),
    );
  }
}
