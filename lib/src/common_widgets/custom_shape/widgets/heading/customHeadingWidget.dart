import 'package:appmanager/src/constants/constColor.dart';
import 'package:flutter/material.dart';

import 'curvedEdgeWidget.dart';
import 'customCircularWidget.dart';

class customHeadingContainer extends StatelessWidget {
  const customHeadingContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return curvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: MColor.primary,
        ),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(left: 250, top: -150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
              Positioned(left: 250, top: 150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

