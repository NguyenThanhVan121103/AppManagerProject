import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common_widgets/widget/button/buttonDialogNotification.dart';
import '../../../../../common_widgets/widget/container/containerDrag.dart';
import '../features/screen/views/notification/widget/addNotification_page.dart';

class NotificationPageView extends StatefulWidget {
  const NotificationPageView({
    super.key,
  });

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> {
  late bool stateNoti;
  late bool stateAppbar;
  late int selectedNumber;
  int documentsLength = 0;
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    stateAppbar = true;
    stateNoti = true;
    selectedNumber = 0;
    getLengthData();
  }

  Future<void> getLengthData() async {
    final int documents = await FirebaseFirestore.instance.collection('products').snapshots().length;
    setState(() {
      documentsLength = documents;
    });
  }

  Map<String, List<QueryDocumentSnapshot>> categorizeNotificationsByDate(List<QueryDocumentSnapshot> docs) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(Duration(days: 1));
    final sevenDaysAgo = today.subtract(Duration(days: 7));
    Map<String, List<QueryDocumentSnapshot>> categorizedData = {
      "Today": [],
      "Yesterday": [],
      "7DaysAgo": [],
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

  Future<void> deleteData(String idData) async {
    setState(() {
      isLoading = true;
    });

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('NotificationData')
          .where('id', isEqualTo: idData)
          .get();
      print("This is querySnapshot.docs: ${querySnapshot.docs}");
      for (var doc in querySnapshot.docs) {
        print("This is doc: $doc");
        await doc.reference.delete();
      }

      print("Da chay o day");
    } catch (e) {
      print("Error deleting document: $e");
    } finally {
      setState(() {
        isLoading = false; // Kết thúc tải
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (stateAppbar == true || selectedNumber == 0)
            ? AppBar(
          backgroundColor: MColor.third,
          title: Center(
              child: Text(
                translation(context).notification,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const AddNotificationPageView()));
                },
                icon: const Icon(Iconsax.search_normal))
          ],
        )
            : AppBar(
          backgroundColor: MColor.third,
          leading: IconButton(
              icon: const Icon(Iconsax.arrow_left),
              onPressed: () {
                setState(() {
                  stateAppbar = true;
                  selectedNumber = 0;
                });
              }),
          title: Center(
              child: Text(
                '${translation(context).notification} (${selectedNumber})',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          actions: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.save_2)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.trash)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.share)),
              ],
            )
          ],
        ),

        // List notification
        body: isLoading
            ? Container(
            color: MColor.primary.withOpacity(0.9),
            child: const Center(child: CircularProgressIndicator(color: Colors.white,)))
            : Container(
          color: MColor.primary.withOpacity(0.9),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('NotificationData')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                        "Something went wrong: ${snapshot.error}"));
              } else if (!snapshot.hasData ||
                  snapshot.data!.docs.isEmpty) {
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
              } else {
                final categorizedData =
                categorizeNotificationsByDate(
                    snapshot.data!.docs);

                return ListView(
                  children: [
                    if (categorizedData["Today"]?.isNotEmpty ?? false) ...[
                      const Text("Today",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Today"]!.reversed
                            .map((doc) => buildNotificationItem(doc,))
                            .toList(),
                      ),
                    ],
                    if (categorizedData["Yesterday"]?.isNotEmpty ?? false) ...[
                      const Text("Yesterday",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Yesterday"]!.reversed
                            .map((doc) => buildNotificationItem(doc))
                            .toList(),
                      ),
                    ],
                    if (categorizedData["7DaysAgo"]?.isNotEmpty ?? false) ...[
                      const Text("7 days ago",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["7DaysAgo"]!.reversed
                            .map((doc) => buildNotificationItem(doc))
                            .toList(),
                      ),
                    ],
                    if (categorizedData["Older"]?.isNotEmpty ?? false) ...[
                      const Text("Older",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white)),
                      Column(
                        children: categorizedData["Older"]!.reversed.map((doc) =>
                            buildNotificationItem(doc, ))
                            .toList(),
                      ),
                    ],
                  ],
                );
              }
            },
          ),
        ));
  }

  Widget buildNotificationItem(QueryDocumentSnapshot doc) {
    return SizedBox(
      height: 190.h,
      child: Dismissible(
        onDismissed: (direction) {
          print(doc.id);
          deleteData(doc['id']);
        },
        key: ValueKey<String>(doc['id']),
        background: ContainerDrag(
            colorContainer: Colors.red.withOpacity(0.6),
            aligment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            iconFunction: Iconsax.trash),
        secondaryBackground: ContainerDrag(
            colorContainer: Colors.red.withOpacity(0.6),
            aligment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 25.sp),
            iconFunction: Iconsax.trash),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            height: 190,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: stateNoti ? Colors.white : Colors.grey,
            ),
            child: Column(
              children: [
                // Giả định rằng iconDaytimeWidget là một widget khác của bạn
                iconDaytimeWidget(
                  icon: Iconsax.notification_bing,
                  datetime: doc['dateTime'],
                  iconButton: Icons.person,
                  onPressed: () {
                  },
                ),
                SizedBox(height: 8.sp),
                const Divider(height: 0),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        doc['title'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        doc['body'],
                        style: TextStyle(fontSize: 16.sp),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
