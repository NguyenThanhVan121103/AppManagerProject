import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/constColor.dart';
import '../../customshape/custom_edges/customEdgeSignIn.dart';
import 'customCircular.dart';

class HeadingSingnIn extends StatelessWidget {
  const HeadingSingnIn({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: MColor.primary,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height *0.30,
          child: Stack(
            children: [
              Positioned(left: 250, top: -150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
              Positioned(left: 250, top: 150,child: CircularContainer(backgroundColor: MColor.third.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      ),
      clipper: CustomEdgeSignIn(),
    );
  }
}
