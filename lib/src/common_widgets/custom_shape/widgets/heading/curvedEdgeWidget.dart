import 'package:flutter/material.dart';

import '../../custom_edges/customEdges.dart';

class curvedEdgeWidget extends StatelessWidget {
  const curvedEdgeWidget({
    super.key, this.child
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: customEdgeContainer(),
        child: child
    );
  }
}


