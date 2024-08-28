import 'package:appmanager/controller/task/taskController.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

import '../../../../../common_widgets/widget/textfield/textFieldInput.dart';
import '../../../../../constants/constColor.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    super.key,
  });

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String _selectedDate = DateFormat.yMd().format(DateTime.now(),);
  String _startTime = "08:30 AM";
  String _endTime = "11:30 PM";
   late bool isButtonActive = false;


  @override
  void initState(){
    controllerTask.driverNameController.addListener(() {
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
      resizeToAvoidBottomInset: false,
      appBar: MAppBar(
        title: const Text("Create Task", style: TextStyle(
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
              TextFieldInput(title: "Driver Name", hintText: "Enter name here", controller: controllerTask.driverNameController,),
              TextFieldInput(title: "License plates", hintText: "Enter number here", controller: controllerTask.licensePlatedController,),
              TextFieldInput(title: "Phone", hintText: "Enter number phone here", controller: controllerTask.numberPhoneController,),
              TextFieldInput(
                title: "Date", hintText: _selectedDate, iconButton: Iconsax.calendar,
              onPressed: (){_getDateFromUser();},controller: controllerTask.dateControlelr = TextEditingController(text: _selectedDate),
              ),
              Row(
                children: [
                  
                  Expanded(
                    child: TextFieldInput(title: "Start time", hintText: _startTime,
                    iconButton: Iconsax.clock,
                      onPressed: (){
                      _getTimeFromUser(isStartTime: true);
                      },
                      controller: controllerTask.startTimeController = TextEditingController(text: _startTime),
                    ),
                  ),
                  SizedBox(width: 16,),
                  
                  Expanded(
                    child: TextFieldInput(title: "End time", hintText: _endTime,
                    iconButton: Iconsax.clock,
                      onPressed: (){
                      _getTimeFromUser(isStartTime: false);
                      },
                      controller: controllerTask.endTimeController = TextEditingController(text: _endTime),
                    ),
                  ),
                ],
              ),
              TextFieldInput(title: "Collection location", hintText: "Enter address here", controller: controllerTask.collectionLocationController ,),
              TextFieldInput(title: "Collection volume", hintText: "Enter volume here", controller: controllerTask.collectionVoulumeController,),
              const SizedBox(height: 20,),

              ButtonNormal(titleButton: "Create Task", colorButton: (isButtonActive) ? MColor.primary : Colors.grey.shade400)
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if(_pickerDate != null) {
      setState(() {
        _selectedDate = DateFormat.yMd().format(_pickerDate);
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
        });
      }else if(isStartTime == false){
        setState(() {
          _endTime = _formatedTime;
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
        controllerTask.startTimeController.text.isNotEmpty == true &&
        controllerTask.endTimeController.text.isNotEmpty == true &&
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


