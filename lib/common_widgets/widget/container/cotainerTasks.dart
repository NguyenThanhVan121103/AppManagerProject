import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/text/textIcon.dart';
import '../../../constants/constColor.dart';
import '../../../database/colectionCalender_DB/colectionCalendar_data.dart';

class ContainerTasks extends StatelessWidget {
  const ContainerTasks({
    super.key,
    required this.index,
    this.taskStatus = 0,
  });
  final int index, taskStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        alignment: Alignment.centerLeft,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          ),
          color: (taskStatus == 0 ) ? MColor.primary : (taskStatus == 1) ? Colors.amber[600] : Colors.green[600],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextIcon(
                      text:"License Plates: ${taskData[index].licensePlates}",
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),

                    TextIcon(text: taskData[index].driverName , icon: Icons.person, color: Colors.white,
                      maxline: 1,
                      overflow: TextOverflow.ellipsis,
                      fontFamily: "Roboto",
                    ),

                    TextIcon(
                      text: "${taskData[index].startTime} - ${taskData[index].endTime}",
                      icon: Iconsax.clock,
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),
                    Text("Collection Voulume: ${taskData[index].collectionVoulume} ton",style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                    ),),

                  ],
                ),
              ),
              const RotatedBox(
                quarterTurns: 3,
                child: Divider(
                  height: 16,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.white,
                ),
              ),
               RotatedBox(
                quarterTurns: 3,
                child: (taskStatus == 0) ? const Text('To do', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                ),
              ) : (taskStatus == 1) ? const Text('Doing Task', style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 16,
                   color: Colors.white
               ),
               ) :  const Text('Task Completed', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                ),
                ) ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
