import 'package:appmanager/database/colectionCalender_DB/colectionCalendar_data.dart';
import 'package:appmanager/features/screen/views/schedule/widget/editTaskPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

import '../../../../../common_widgets/widget/container/containerTextTask.dart';
import '../../../../../constants/constColor.dart';

class TaskDetailPageView extends StatelessWidget {
  const TaskDetailPageView({
    super.key,
    required this.index,
    required this.date,
  });
  final DateTime date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MAppBar(
        title: Text("${taskData[index].licensePlates}", style: TextStyle(fontFamily: "Roboto", fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
        showBackArrows: true,
        iconColor: Colors.white,
        backgroundColor: MColor.primary,
        action: [
          PopupMenuButton(
            iconColor: Colors.white,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Edit"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditTask(index: index,date: date) ));
                },
              ),
              const PopupMenuItem(child: Text("Delete")),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(

          children: <Widget>[
            containerTextTask(index: index, title: "Driver Name", content: taskData[index].driverName,),
            containerTextTask(index: index, title: "License plates", content: taskData[index].licensePlates,),
            containerTextTask(index: index, title: "Phone", content: taskData[index].numberPhone,),
            containerTextTask(index: index, title: "Date", content: taskData[index].date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                containerTextTask(index: index,iconText: Iconsax.clock , title: "Start: ", content: taskData[index].endTime,),
                containerTextTask(index: index,iconText: Iconsax.clock, title: "End: ", content: taskData[index].startTime,),
              ],
            ),

            containerTextTask(index: index, title: "Collection Volume", content: "${taskData[index].collectionVoulume}",),
            Text("Collection Location: ${taskData[index].collectionLocation}",
              style: TextStyle(fontSize: 20, fontFamily: "Roboto"),),
            Spacer(),

            ButtonNormal(titleButton: "Doing Task"),
            SizedBox(height: 8,),
            ButtonNormal(titleButton: "Task Completed"),
          ],
        ),
      ),
    );
  }
}

