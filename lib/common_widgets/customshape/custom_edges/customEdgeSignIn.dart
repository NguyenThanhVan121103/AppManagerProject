import 'package:flutter/cupertino.dart';

class CustomEdgeSignIn extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(
        size.width*0.4, size.height*0.5,
        size.width*0.5, size.height*1.3,
        size.width, size.height*0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}