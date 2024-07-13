import 'package:flutter/material.dart';

class customEdgeContainer extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    
    final path = Path();

    path.lineTo(0, h);

    final firstPoint = Offset(0, h-20);
    final secondPoint = Offset(0+30, h-20);
    path.quadraticBezierTo(firstPoint.dx, firstPoint.dy, secondPoint.dx, secondPoint.dy);

    final thirdPoint = Offset(0+30, h-20);
    final fourthPoint = Offset(w-30,h-20);
    path.quadraticBezierTo(thirdPoint.dx, thirdPoint.dy, fourthPoint.dx, fourthPoint.dy);

    final fifthPoint = Offset(w, h-20);
    final sixthPoint = Offset(w, h);
    path.quadraticBezierTo(fifthPoint.dx, fifthPoint.dy, sixthPoint.dx, sixthPoint.dy);

    path.lineTo(w, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}