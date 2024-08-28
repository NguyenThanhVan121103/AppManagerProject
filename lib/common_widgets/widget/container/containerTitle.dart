import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  const ContainerTitle({
    super.key,required this.title, this.heightContainer = 60,
  });

  final String title;
  final double? heightContainer;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Container(
      alignment: Alignment.center,
      height: heightContainer,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,border: const Border(
        top: BorderSide(color: Colors.yellow),
        bottom: BorderSide(color: Colors.yellow),
        right: BorderSide(color: Colors.yellow),
        left: BorderSide(color: Colors.yellow),
      )
      ),
      child: Text(title, style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),),
    ),
    );
  }
}
