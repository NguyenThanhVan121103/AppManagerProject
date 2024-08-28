import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';

import '../container/customEdges.dart';
import 'customCircular.dart';

class curvedEdgeWidget extends StatelessWidget {
  const curvedEdgeWidget({
    super.key,
    required this.child,
    this.heightHeading = 400,
  });

  final Widget child;
  final double heightHeading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: MColor.primary,
      ),
      child: SizedBox(
        height: heightHeading,
        child: Stack(
          children: [
            Positioned(left: 250, top: -150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
            Positioned(left: 250, top: 150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}


