import 'package:flutter/material.dart';

class ContainerTitle extends StatelessWidget {
  const ContainerTitle({
    super.key,required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Container(
      alignment: Alignment.center,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,border: Border(
        top: BorderSide(color: Colors.yellow),
        bottom: BorderSide(color: Colors.yellow),
        right: BorderSide(color: Colors.yellow),
        left: BorderSide(color: Colors.yellow),
      )
      ),
      child: Text(title, style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      ),),
    ),
    );
  }
}
