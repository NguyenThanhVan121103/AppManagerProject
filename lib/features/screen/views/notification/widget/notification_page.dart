import 'package:appmanager/common_widgets/widget/container/containerNotification.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/controller/notification/notificationController.dart';
import 'package:appmanager/features/screen/views/notification/widget/addNotification_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  int perPage = 10;
  late DocumentSnapshot _lastDocument;
  ScrollController _scrollController = ScrollController();
  bool _gettingMoreNotification = false;
  bool _moreNotificationAvailable = true;
  late List<QueryDocumentSnapshot> reversedNotification;
  late DateTime now;
  late DateTime today;
  late DateTime yesterday;
  late DateTime sevenDaysAgo ;
  var categoryData;


  // step 2
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late List<QueryDocumentSnapshot> _notification;

  @override
  void initState() {
    super.initState();
    notiController.zeroCountNoti();

    _fetchNotifications();

    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.25;

      if (maxScroll - currentScroll <= delta && !_gettingMoreNotification && _moreNotificationAvailable) {
        _getMoreNotification();
      }
    });

    now = DateTime.now();
    today = DateTime(now.year, now.month, now.day);
    yesterday = today.subtract(Duration(days: 1));
    sevenDaysAgo = today.subtract(Duration(days: 3));
  }

// Hàm async để lấy thông báo
  void _fetchNotifications() async {
    setState(() {
      isLoading = true;
    });
    reversedNotification = await _getNotification();
    setState(() {
      isLoading = false;
    });
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
      _fetchNotifications();
      print("Delete Scussfully");
    } catch(e){
      print("We have an error: $e");
    }finally{
      setState(() {
        isLoading = false;
      });
    }
  }

  //*****************************************************************************
  Future<List<QueryDocumentSnapshot>> _getNotification() async {
    Query q = _firestore.collection("NotificationData").orderBy("id", descending: true).limit(perPage);

    setState(() {
      isLoading = true;
    });

    QuerySnapshot querySnapshot = await q.get();
    _notification = querySnapshot.docs.reversed.toList();
    _lastDocument = querySnapshot.docs[querySnapshot.docs.length - 1];
    List<QueryDocumentSnapshot> reversedNotification = _notification.reversed.toList();
    categoryData = categorizeNotificationByDate(reversedNotification);
    setState(() {
      isLoading = false;
    });
    return reversedNotification;
  }

  _getMoreNotification() async {
    if (!_moreNotificationAvailable || _gettingMoreNotification) {
      return;
    }

    setState(() {
      _gettingMoreNotification = true;
    });

    Query q = _firestore.collection("NotificationData")
        .orderBy("id", descending: true)
        .startAfter([(_lastDocument.data() as Map<String, dynamic>)["id"]])
        .limit(perPage);

    try {
      QuerySnapshot querySnapshot = await q.get();
      if (querySnapshot.docs.isEmpty) {
        _moreNotificationAvailable = false;
      } else {
        _lastDocument = querySnapshot.docs.last;
        setState(() {
          _notification.addAll(querySnapshot.docs);
          reversedNotification.addAll(querySnapshot.docs.reversed);
          categoryData = categorizeNotificationByDate(reversedNotification);
        });
      }
    } finally {
      setState(() {
        _gettingMoreNotification = false;
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
        child:(_notification.length == 0 )
            ? Center(
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
        )
            : Column(
              children: [
                Flexible(
                  child: ListView.builder(
                            controller: _scrollController,
                          itemCount: reversedNotification.length,
                          itemBuilder: (BuildContext ctx, int index){
                            return BuildNotificationItem2(
                              onDismissed:(direction){
                                deleteData((reversedNotification[index].data() as Map<String, dynamic>)["id"].toString());
                                },
                              isSelected: isSelected,
                              id: (reversedNotification[index].data() as Map<String, dynamic>)["id"].toString(),
                              title: (reversedNotification[index].data() as Map<String, dynamic>)["title"].toString(),
                              dateTime: (reversedNotification[index].data() as Map<String, dynamic>)["dateTime"].toString(),
                              body: (reversedNotification[index].data() as Map<String, dynamic>)["body"].toString(),);
                            }),
                ),
              ],
            )
      )
    );
  }
}

