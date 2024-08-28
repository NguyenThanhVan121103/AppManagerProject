import 'package:appmanager/common_widgets/widget/button/buttonTitle.dart';
import 'package:appmanager/database/user_DB/user_DB.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';

import '../../../../../common_widgets/widget/textfield/textFieldSimple.dart';

class EditProfilePageView extends StatefulWidget {
  const EditProfilePageView({super.key});

  @override
  State<EditProfilePageView> createState() => _EditProfilePageViewState();
}

class _EditProfilePageViewState extends State<EditProfilePageView> {
  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        appBar: const MAppBar(iconColor: MColor.third,
        showBackArrows: true,
        backgroundColor: MColor.primary,
        title: Text("Edit profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar & Button
              Container(
                height: MediaQuery.of(context).size.height*0.20,
                decoration: BoxDecoration(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //Avatar
                    Positioned(top: 50.sp,child: Container(
                        decoration: BoxDecoration(
                            color: MColor.third,
                            borderRadius: BorderRadius.circular(100),
                          border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(1, 3),
                            ),
                          ]
                        ),
                        child: ImageContainerWidget(imgURl: 'assets/images/maleAvatar.png', height: 60, width: 60,borderRadius: 100,))),
                    Positioned(bottom: 35.sp, left: 215.sp, child:GestureDetector(
                      onTap: (){_getImgFromUser(context);},
                      child: Container(height: 30, width: 30, decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(1, 3),
                            ),
                          ]
                      ),child: Icon(Icons.camera_alt),),
                    ),)
                  ],
                )
              ),

              // TextField
              TextFieldSimple(title: "Name",controller: TextEditingController(text: userData[0].name),),
              const SizedBox(height: 32,),
              TextFieldSimple(title: "Email",controller: TextEditingController(text: userData[0].email),),
              const SizedBox(height: 32,),
              TextFieldSimple(title: "Number phone",controller: TextEditingController(text: userData[0].phoneNumber),),
              const SizedBox(height: 32,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date of birth", style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),),
                    GestureDetector(onTap: (){_getDateFromUser();},child: Container(
                      margin: EdgeInsets.only(top: 8),
                      width: MediaQuery.of(context).size.width,
                      height: _selectedDate != DateFormat.yMd().format(DateTime.now()) ? 36 : 16,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                    child: _selectedDate != DateFormat.yMd().format(DateTime.now()) ? Text("$_selectedDate", style:  const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),) : null,
                    ))
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextButton(onPressed: (){_deleteAccount(context);}, child: Text("Deleted Account", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, color: Colors.blueGrey
              ),)),
              Spacer(),
              ButtonNormal(titleButton: "Update")
            ],
          ),
        )
    );
  }
  Future<void> _getImgFromUser(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text("Please select image source", style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height*0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonNormal(titleButton: "Camera", onPressed: (){Navigator.pop(context);},),
              SizedBox(height: 16,),
              ButtonNormal(titleButton: "Library", onPressed: (){Navigator.pop(context);},)
            ],
          ),
        ),
      );
    });
  }
  Future<void> _deleteAccount(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text("Are you sure delete account!", style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height*0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonNormal(titleButton: "Disagree", onPressed: (){Navigator.pop(context);},),
              SizedBox(height: 16,),
              ButtonNormal(titleButton: "Agree", onPressed: (){Navigator.pop(context);},)
            ],
          ),
        ),
      );
    });
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
  }
}

