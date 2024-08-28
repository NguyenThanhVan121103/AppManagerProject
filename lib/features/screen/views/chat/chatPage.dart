import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/database/chat_DB/chat_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

import '../../../../common_widgets/widget/container/containerChatBox.dart';

class ChatPageView extends StatefulWidget {
  const ChatPageView({super.key});

  @override
  State<ChatPageView> createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<ChatPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        showBackArrows: true,
        title: Text(translation(context).chatSupport, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        iconColor: MColor.third,
        action: [IconButton(onPressed: (){}, icon: Icon(Iconsax.clock, color: Colors.white,))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                      child: Text("${translation(context).hello} Nguyen Thanh Van"),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: 300.sp,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                    child: Column(children: [
                      Text(translation(context).titleQuestion),
                      SizedBox(height: 8,),
                      Divider(height: 0,),
                      SizedBox(height: 8,),
                      SizedBox(
                        height: 200.sp,
                        child: ListView(children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ChatBox(title: translation(context).question1),
                          ),
                          Divider(height: 0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ChatBox(title: translation(context).question2),
                          ),
                          Divider(height: 0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ChatBox(title: translation(context).question3),
                          ),
                          Divider(height: 0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ChatBox(title: translation(context).question4),
                          ),
                          Divider(height: 0,),
                        ],)
                      )
                    ],),
                  )
                ],
              ),
            ),

          ]))
        ],
      )
    );
  }
}

