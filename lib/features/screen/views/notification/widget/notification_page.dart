import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/database/notification_DB/notification_DB.dart';
import 'package:appmanager/features/screen/views/search/widget/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/refresh/refreshIndicatorWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/widget/button/buttonDialogNotification.dart';
import '../../../../../common_widgets/widget/container/containerDrag.dart';


class notificationPageView extends StatefulWidget {
  const notificationPageView({
    super.key,
  });


  @override
  State<notificationPageView> createState() => _notificationPageViewState();
}

class _notificationPageViewState extends State<notificationPageView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicator = GlobalKey<RefreshIndicatorState>();
  late List<bool> pressedAttentions = notificationData.map((e) => false).toList();
  late bool stateAppbar;
  late int selectedNumber;

  @override
  void initState() {
    super.initState();
    stateAppbar = true;
    selectedNumber = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (stateAppbar == true || selectedNumber == 0) ? MAppBar(
        backgroundColor: MColor.third,
        title: const Center(
            child: Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        action: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPageView()));
          }, icon: Icon(Iconsax.search_normal))
        ],
      ) : MAppBar(
        backgroundColor: MColor.third,
        lendingIcon: Iconsax.arrow_left,
        backOnTap: (){
          setState(() {
            stateAppbar = true;
            pressedAttentions = notificationData.map((e) => false).toList();
            selectedNumber = 0;
          });

        },
        title: Center(
            child: Text(
              'Notifications (${selectedNumber})',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
        ),
        action: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(Iconsax.save_2)),
              IconButton(onPressed: (){}, icon: Icon(Iconsax.trash)),
              IconButton(onPressed: (){}, icon: Icon(Iconsax.share)),

            ],
          )
        ],
      ),

      // List notification
      body: Container(
          color: MColor.primary.withOpacity(0.9),
          child: RefreshIndicatorWidget(
            refreshIndicator: _refreshIndicator,
            child:(pressedAttentions.length != 0)
                ? ListView.builder(  // If Database is not empty
              itemBuilder: (BuildContext context, int index) {
                final pressAttention = pressedAttentions[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      setState(() {
                        // If deletion of item is attention
                        (selectedNumber == 0)
                            ? (stateAppbar= true)
                            : (pressedAttentions[index] == true)
                            ? (selectedNumber -=1 , (selectedNumber == 0)
                            ? (stateAppbar = true)
                            : stateAppbar )
                            : (selectedNumber)  ;

                        // Delete item
                        notificationData.removeAt(index);

                        // sort true false in the list;
                        if(pressedAttentions[index] == false) {
                          for(int j = index; j < pressedAttentions.length; j++){
                            if(pressedAttentions[j] == true) {
                              pressedAttentions[j - 1] = true;
                              pressedAttentions[j] = false;
                            }
                          }
                        } else{
                          pressedAttentions[index] = false;
                          for(int j = index; j < pressedAttentions.length; j++){
                            if(pressedAttentions[j] == true) {
                              pressedAttentions[j - 1] = true;
                              pressedAttentions[j] = false;
                            }
                          }
                        }
                      });
                    },

                    key: ValueKey<String>(notificationData[index].title),

                    // Drag Left
                    background: ContainerDrag(colorContainer: Colors.red.withOpacity(0.6),aligment: Alignment.centerLeft, padding: EdgeInsets.symmetric(horizontal: 25.sp), iconFunction: Iconsax.trash),

                    // Drag Right
                    secondaryBackground: ContainerDrag(colorContainer: Colors.red.withOpacity(0.6),aligment: Alignment.centerRight, padding: EdgeInsets.symmetric(horizontal: 25.sp), iconFunction: Iconsax.trash),

                    // content
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: GestureDetector(
                        onLongPressStart: (_) => setState(() {
                          pressedAttentions[index] = !pressAttention;
                          stateAppbar = false;
                          (pressedAttentions[index] == true) ? selectedNumber += 1
                              : (selectedNumber == 0) ? (selectedNumber, stateAppbar = true, pressedAttentions = notificationData.map((e) => false).toList()) : (selectedNumber -=1, stateAppbar = false);
                        }),

                        //Icon + title + suptitle + color
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          height: 190,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (pressAttention) ? Colors.grey : Colors.white,
                          ),
                          child: Column(
                            children: [
                              iconDaytimeWidget(icon: Iconsax.notification_bing, datetime: notificationData[index].time, iconButton: (pressAttention && selectedNumber != 0) ?  Icons.check : Icons.person),
                              SizedBox(height: 8.sp),
                              Divider(height: 0,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(notificationData[index].title, style: TextStyle(fontWeight:FontWeight.bold, fontSize: 20.sp), maxLines: 1, overflow: TextOverflow.ellipsis,),
                                    Text(notificationData[index].suptitle, style: TextStyle(fontSize: 16.sp), maxLines: 3, overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
              },
              itemCount: notificationData.length,
            )

            // Elif (Database is empty)
                : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(top: 200.sp),
                  child: const Column(
                    children: [
                      Icon(Iconsax.notification, size: 160, color: Colors.white,),
                      Text("No Notification Yet", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                      Text("When you get notification, they'll show up hree.", style: TextStyle(color: Colors.white),)
                    ],
                  ),
                );
              },
              itemCount: 1,
            ),
          )
      ),
    );
  }
}




