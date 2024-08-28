import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/database/user_DB/user_DB.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

class EmailSupportPageView extends StatefulWidget {
  const EmailSupportPageView({super.key});

  @override
  State<EmailSupportPageView> createState() => _EmailSupportPageViewState();
}

class _EmailSupportPageViewState extends State<EmailSupportPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        title: Text(translation(context).emailSupport, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        lendingIcon: Icons.close,
        backOnTap: Get.back,
        iconColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(children: [
          SizedBox(height: 8,),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white,
            child: Column(children: [
              TextFieldInput(title: "Email", controller: TextEditingController(text: userData[0].email),),
              TextFieldInput(title: translation(context).service,),
              TextFieldInput(title: translation(context).title,),
              TextFieldInput(title: translation(context).description,heightContainer: 100, expands: true,),
              SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Text(translation(context).fileAttachment, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
                ButtonNormal(titleButton: translation(context).selectFile, borderRadius: 0,)
              ],),
            ],),
          ),
          Spacer(),
          ButtonNormal(titleButton: translation(context).send, borderRadius: 0,)
        ],
        ),
      )
    );
  }
}
