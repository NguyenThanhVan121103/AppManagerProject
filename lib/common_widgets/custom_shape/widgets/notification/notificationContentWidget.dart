import 'package:flutter/material.dart';

class notificationContentWiget extends StatelessWidget {
  const notificationContentWiget({
    super.key,
    required this.index,
    required this.title,
    required this.supTitle,
  });

  final int index;
  final String title, supTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text('${title} ${index}', style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20), maxLines: 1,),
          Text('${supTitle} ${index}', style: TextStyle(fontSize: 16), maxLines: 3,),
        ],
      ),
    );
  }
}

