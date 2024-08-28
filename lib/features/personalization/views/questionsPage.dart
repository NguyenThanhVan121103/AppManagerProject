import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/database/notification_DB/notification_DB.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class QuestionsPageView extends StatefulWidget {
  const QuestionsPageView({super.key});

  @override
  State<QuestionsPageView> createState() => _QuestionsPageViewState();
}

class _QuestionsPageViewState extends State<QuestionsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        backgroundColor: MColor.primary,iconColor: Colors.white,
        title: Text("Frequently asked questions", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(itemBuilder: (BuildContext context, int index){
            return  Theme(
              data: ThemeData().copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(title: Text(notificationData[index].title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
                children: [
                  ListTile(title: Text(notificationData[index].suptitle),)
                ],
              ),
            );
          },
            itemCount: notificationData.length,
          )
        ],
      ),
    );
  }
}
