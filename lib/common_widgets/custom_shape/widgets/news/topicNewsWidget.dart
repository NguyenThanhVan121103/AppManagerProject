import 'package:appmanager/features/screen/views/news/widget/newsDemoPage.dart';
import 'package:flutter/material.dart';
import 'buttonNewsWidget.dart';

class topicNewsWidget extends StatelessWidget {
  const topicNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return buttonNewsWidget(index: index, onTap: newsDemoPageView(),);
      },
      itemCount: 20,
    );
  }
}

