import 'package:appmanager/common_widgets/widget/button/buttonFunctionAccount.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/features/screen/views/chat/chatPage.dart';
import 'package:appmanager/features/screen/views/chat/emailSupportPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';

class SupportPageView extends StatefulWidget {
  const SupportPageView({super.key});

  @override
  State<SupportPageView> createState() => _SupportPageViewState();
}

class _SupportPageViewState extends State<SupportPageView> {
  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        title: Text(translation(context).support, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        showBackArrows: true,
        iconColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              FunctionAccountWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ChatPageView()));},titleButton: translation(context).chatSupport, icon: Icons.chat_outlined, backgroundColor: Colors.white,),
              Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
              FunctionAccountWidget(onPressed: (){_showBottomSheet(context);},titleButton: translation(context).phoneSupport, icon:  Icons.phone, backgroundColor: Colors.white,),
              Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
              FunctionAccountWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EmailSupportPageView()));},titleButton: translation(context).emailSupport, icon: Icons.email_outlined, backgroundColor: Colors.white,)
            ]))
          ],
        ),
      ),
    );
  }
  void _showBottomSheet(BuildContext context){
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12),)
        ),
        height: MediaQuery.of(context).size.height*0.25,
        padding: EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: EdgeInsets.all(8),child: Text(translation(context).openWith, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
          Divider(height: 0, color: Colors.grey,),
          Row(children: [
            ImageContainerWidget(imgURl: "assets/logo/logoZalo.png", width: 30, height: 30,),
             Text("Zalo")
          ],),
          Row(children: [
            ImageContainerWidget(imgURl: "assets/logo/logoPhone.png", width: 30, height: 30,),
            Text(translation(context).phone)
          ],),
          Divider(height: 0, color: Colors.grey,),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            GestureDetector(onTap: (){Navigator.pop(context);},child: Text(translation(context).onlyOne, style: TextStyle(color: Colors.grey[400]),)),
            SizedBox(width: 32,),
            GestureDetector(onTap: (){Navigator.pop(context);},child: Text(translation(context).alway,style: TextStyle(color: Colors.grey[400]),)),
            SizedBox(width: 16,),
          ],
          )
        ],),
      )
    );
  }

}
