import 'package:appmanager/common_widgets/widget/container/containerNotification.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/controller/notification/notificationController.dart';
import 'package:appmanager/features/screen/views/notification/widget/addNotification_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

class NotificationPageView extends StatefulWidget {
  const NotificationPageView({super.key});

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> {
  bool isLoading = false;
  NotificationController notiController = NotificationController();
  bool isSelected = false;
  List<bool> selectionList = [];

  @override
  void initState(){
    super.initState();
    notiController.zeroCountNoti();
  }
  List<bool> createSelectionList (List<QueryDocumentSnapshot> docs){
    selectionList = docs.map((e) => false).toList();
    return selectionList;
  }

  Map<String, List<QueryDocumentSnapshot>> categorizeNotificationByDate(List<QueryDocumentSnapshot> docs){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final sevenDaysAgo = today.subtract(Duration(days: 3));
    Map<String, List<QueryDocumentSnapshot>> categorizedData = {
      "Today": [],
      "Yesterday": [],
      "Older": [],
    };

    for (var doc in docs) {
      final timestamp = (doc['timeStamp'] as Timestamp).toDate();
      if (timestamp.compareTo(today) == 0) {
        categorizedData["Today"]?.add(doc);
      } else if (timestamp.compareTo(yesterday) == 0) {
        categorizedData["Yesterday"]?.add(doc);
      } else if (timestamp.compareTo(sevenDaysAgo) == 0) {
        categorizedData["7DaysAgo"]?.add(doc);
      } else {
        categorizedData["Older"]?.add(doc);
      }
    }
    return categorizedData;
  }

  Future<void> deleteData(String idData) async{
    setState(() {
      isLoading = true;
    });

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("NotificationData")
          .where('id', isEqualTo: idData)
          .get();
      for (var doc in querySnapshot.docs){
        await doc.reference.delete();
      }
    } catch(e){
      print("We have an error: $e");
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          showBackArrows: true,
          iconColor: Colors.white,
          title: Text('Notification', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
          backgroundColor: (selectionList.every((element) => element == false)) ? MColor.primary : Colors.white,
          action: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotificationPageView()));
            }, icon: Icon(Iconsax.add, color: Colors.white,))
          ],
        ),
        body: isLoading
            ? Container(
          alignment: Alignment.center,
          color: MColor.primary,
          child: const CircularProgressIndicator(color: Colors.white,),
        ): Container(
          color: MColor.primary,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("NotificationData")
                .snapshots(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              }
              else if(snapshot.hasError){
                return Center(
                    child: Text(
                        "Something went wrong: ${snapshot.error}"));
              }
              else if(!snapshot.hasData ||
                  snapshot.data!.docs
                      .isEmpty){
                return Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 200.sp),
                    child: const Column(
                      children: [
                        Icon(
                          Iconsax.notification,
                          size: 160,
                          color: Colors.white,
                        ),
                        Text(
                          "No Notification Yet",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "When you get notification, they'll show up here.",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                );
              } else{
                final categorizedData = categorizeNotificationByDate(snapshot.data!.docs);
                final selectionData = createSelectionList(snapshot.data!.docs);
                selectionList = selectionData;
                return ListView(
                  children: [
                    if(categorizedData["Today"]?.isNotEmpty ?? false)...[
                      const Text("Today",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Today"]!.asMap().entries.toList().reversed.map((entry){
                          int index = entry.key;
                          var doc = entry.value;
                          return BuildNotificationItem(
                            doc: doc, onDismissed: (direction){
                            deleteData(doc["id"]);
                          }, isSelected: selectionData[index],
                          );
                        }).toList(),
                      ),
                    ],
                    if(categorizedData["Yesterday"]?.isNotEmpty ?? false)...[
                      const Text("Yesterday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Yesterday"]!.asMap().entries.toList().reversed.map((entry){
                          int index = entry.key;
                          var doc = entry.value;
                          return BuildNotificationItem(
                            doc: doc, onDismissed: (direction){
                            deleteData(doc["id"]);
                          }, isSelected: selectionData[index],
                          );
                        }).toList(),
                      ),
                    ],
                    if(categorizedData["Older"]?.isNotEmpty ?? false)...[
                      const Text("7 days ago",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Older"]!.asMap().entries.toList().reversed.map((entry){
                          int index = entry.key;
                          var doc = entry.value;
                          return BuildNotificationItem(
                            doc: doc, onDismissed: (direction){
                            deleteData(doc["id"]);
                          }, isSelected: selectionData[index],
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                );
              };
            },
          ),
        )
    );
  }
}

