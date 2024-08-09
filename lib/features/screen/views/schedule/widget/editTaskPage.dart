import 'package:appmanager/database/colectionCalender_DB/colectionCalendar_data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

import '../../../../../common_widgets/widget/textfield/textFieldInput.dart';
import '../../../../../constants/constColor.dart';
import '../../../../../controller/task/taskController.dart';


class EditTask extends StatefulWidget {
  const EditTask({
    super.key,
    required this.index,
    required this.date,
  });
  final int index;
  final DateTime date;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  String _selectedDate = DateFormat.yMd().format(DateTime.now(),);
  late bool isButtonActive = true;
  String _startTime = "08:30 AM";
  String _endTime = "11:30 PM";




  @override
  void initState(){
    controllerTask.driverNameController= TextEditingController(text: taskData[widget.index].driverName);
    controllerTask.numberPhoneController = TextEditingController(text: taskData[widget.index].numberPhone);
    controllerTask.licensePlatedController = TextEditingController(text: taskData[widget.index].licensePlates);
    controllerTask.dateControlelr = TextEditingController(text: taskData[widget.index].date);
    controllerTask.startTimeController = TextEditingController(text: taskData[widget.index].startTime);
    controllerTask.endTimeController = TextEditingController(text: taskData[widget.index].endTime);
    controllerTask.collectionVoulumeController = TextEditingController(text: "${taskData[widget.index].collectionVoulume}");
    controllerTask.collectionLocationController = TextEditingController(text: taskData[widget.index].collectionLocation);


    _startTime = taskData[widget.index].startTime;
    _endTime = taskData[widget.index].endTime;
    controllerTask.driverNameController.addListener(() {
      _isButtonActive();
    });
    controllerTask.licensePlatedController.addListener(() {
      _isButtonActive();
    });
    controllerTask.numberPhoneController.addListener(() {
      _isButtonActive();
    });
    controllerTask.collectionVoulumeController.addListener(() {
      _isButtonActive();
    });
    controllerTask.collectionVoulumeController.addListener(() {
      _isButtonActive();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: const Text("Eidt Task", style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.white,
        showBackArrows: true,
        action: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person))
        ],
      ),
      body: SingleChildScrollView(
        child:  Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text("Add Task", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              const SizedBox(height: 16.0,),
              TextFieldInput(title: "Driver Name", controller: controllerTask.driverNameController,),
              TextFieldInput(title: "License plates", controller: controllerTask.licensePlatedController,),
              TextFieldInput(title: "Phone", controller: controllerTask.numberPhoneController,),
              TextFieldInput(
                title: "Date", hintText: _selectedDate, iconButton: Iconsax.calendar,
                onPressed: (){_getDateFromUser();},
                controller: controllerTask.dateControlelr ,
              ),
              Row(
                children: [

                  Expanded(
                    child: TextFieldInput(title: "Start time", hintText: _startTime,
                      iconButton: Iconsax.clock,
                      onPressed: (){
                        _getTimeFromUser(isStartTime: true);
                      },
                      controller: controllerTask.startTimeController,
                    ),
                  ),
                  SizedBox(width: 16,),

                  Expanded(
                    child: TextFieldInput(title: "End time", hintText: _endTime,
                      iconButton: Iconsax.clock,
                      onPressed: (){
                        _getTimeFromUser(isStartTime: false);
                      },
                      controller: controllerTask.endTimeController,
                    ),
                  ),
                ],
              ),
              TextFieldInput(title: "Collection location", controller: controllerTask.collectionLocationController,),
              TextFieldInput(title: "Collection volume", controller: controllerTask.collectionVoulumeController,),
              const SizedBox(height: 20,),

              ButtonNormal(titleButton: "Edit Task", colorButton: (isButtonActive) ? MColor.primary : Colors.grey.shade400,)
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if(_pickerDate != null) {
      setState(() {
        _selectedDate = DateFormat.yMd().format(_pickerDate);
        controllerTask.dateControlelr = TextEditingController(text: _selectedDate);
      });
    }
    else{
      print("Something is wrong!!!!");
    }
  }
  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? _pickedTime = await _showTimePicker(isStartTime: isStartTime);
    if (_pickedTime != null) {
      String _formatedTime = _pickedTime.format(context);
      if(isStartTime == true){
        setState(() {
          _startTime = _formatedTime;
          controllerTask.startTimeController = TextEditingController(text: _startTime);
        });
      }else if(isStartTime == false){
        setState(() {
          _endTime = _formatedTime;
          controllerTask.endTimeController = TextEditingController(text: _endTime);
        });
      }
    }
  }


  _showTimePicker({required bool isStartTime}){
    return showTimePicker(
        context: context,
        initialEntryMode: TimePickerEntryMode.input,
        initialTime: (isStartTime) ? TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0],
            )) : TimeOfDay(
            hour: int.parse(_endTime.split(":")[0]),
            minute: int.parse(_endTime.split(":")[1].split(" ")[0],
            ))
    );
  }

  _isButtonActive() {
    if(
    controllerTask.driverNameController.text.isNotEmpty == true &&
        controllerTask.licensePlatedController.text.isNotEmpty == true &&
        controllerTask.numberPhoneController.text.isNotEmpty == true &&
        controllerTask.collectionVoulumeController.text.isNotEmpty == true &&
        controllerTask.collectionLocationController.text.isNotEmpty == true
    ) {
      setState(() {
        isButtonActive = true;
      });
    } else {
      setState(() {
        isButtonActive = false;
      });
    }
  }


}


