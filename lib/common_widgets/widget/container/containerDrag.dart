import 'package:flutter/material.dart';

class ContainerDrag extends StatelessWidget {
  const ContainerDrag({
    super.key,
    required this.aligment,
    required this.colorContainer,
    required this.padding,
    required this.iconFunction,
  });
  final AlignmentGeometry aligment;
  final Color colorContainer;
  final EdgeInsetsGeometry padding;
  final IconData iconFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      color: colorContainer,
      padding: padding,
      child: Icon(iconFunction, size: 30,),
    );
  }
}