import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:flutter/material.dart';

class detailedInfor extends StatelessWidget {
  const detailedInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        title: Text('Detailed information here'),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
