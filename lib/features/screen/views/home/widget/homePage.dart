import 'package:appmanager/classes/dateLastOldNoti/dateLastOldNoti.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/controller/notification/notificationController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/container/searchBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../../../classes/countNotification/countNotification.dart';
import '../../../../../common_widgets/widget/button/buttonTitle.dart';
import '../../../../../common_widgets/widget/heading/curvedEdge.dart';
import '../../../../../common_widgets/widget/image/imageSlider.dart';
import '../../../../../common_widgets/widget/listview/listviewMenu.dart';
import '../../../../../common_widgets/widget/listview/listviewNewsShort.dart';
import '../../../../../constants/constColor.dart';
import '../../../../../database/news_DB/new_data.dart';
import '../../notification/widget/notification_page.dart';
import '../../search/widget/searchPage.dart';




class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late ScrollController _scrollController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  bool _isButtonVisible = false;
  NotificationController controller = NotificationController();
  int? countNoti = LocalCountNotification.getCountNoti();
  String dateNotification = "";
  int index = 0;

  initInfo(){
    var androidInitialize = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize,);

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (NotificationResponse reponse ) async{
      String? payload = reponse.payload;
      try{
        if(payload != null && payload.isNotEmpty){
          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPageView()));
        } else{
        }
      }catch (e){
        print("We have an Error: $e");
      }
      return;
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{
      print("..................onMessage...............");
      print("onMessage: ${message.notification?.title}/${message.notification?.body}}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(), htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(), htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'dbfood', 'dbfood', importance: Importance.high,
        styleInformation: bigTextStyleInformation, priority: Priority.high, playSound: true,
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: const DarwinNotificationDetails()
      );
      await flutterLocalNotificationsPlugin.show(
          0, message.notification?.title, message.notification?.body,
          platformChannelSpecifics,
          payload: message.data['body']);
    });
  }

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if(_scrollController.offset > 200){
        setState(() {
          _isButtonVisible = true;
        });
      } else{
        setState(() {
          _isButtonVisible = false;
        });
      }
    });
    initInfo();
    LocalLastDayOldNoti.init().then((_) {
      LocalLastDayOldNoti.setLastDayNoti(DateTime.now().toString());
      dateNotification = LocalLastDayOldNoti.getLastDayNoti()!;
    });
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }

  int catagorizeOldNotificationByDate(List<QueryDocumentSnapshot> docs){
    final lastTimeNoti = dateNotification; // save last time old notification
    NotificationController controller = NotificationController();
    controller.zeroCountNoti();
    for (var doc in docs){
      DateTime timeOldNoti = DateTime.parse(lastTimeNoti!);
      if(timeOldNoti.compareTo(DateTime.parse(doc['id'])) < 0){
        controller.newNotification();
        controller.addCountNoti();
      } else {
        controller.zeroCountNoti();
        controller.notNewNotification();
      }
      index = controller.countNoti.value;
    }
    return index;
  }
  String dateOldNotificationByDate(List<QueryDocumentSnapshot> docs){
    for (var doc in docs){
      LocalLastDayOldNoti.setLastDayNoti(doc["id"]);
      dateNotification = doc["id"];
    }
    return LocalLastDayOldNoti.getLastDayNoti()!;
  }

  saveDateTime(String dateTime){
    controller.notNewNotification();

    LocalLastDayOldNoti == dateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: false,
                snap: false,
                backgroundColor: MColor.primary,
                expandedHeight: MediaQuery.of(context).size.height*0.4,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translation(context).hi,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: MColor.third,
                          ),
                        ),
                        Text(
                          'Nguyen Thanh Van',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: MColor.third,
                          ),
                        )
                      ],
                    ),
                    Flexible(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection("NotificationData").snapshots(),
                          builder: (context, snapshot){
                            if (snapshot.connectionState == ConnectionState.waiting){
                              return IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification, color: Colors.white,
                                size: 30,
                              ),);
                            } else if (snapshot.hasError){
                              return IconButton(onPressed: () {}, icon: const Icon(Iconsax.watch),);
                            } else if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                              return IconButton(onPressed: () {}, icon: const Icon(Iconsax.activity),);
                            }else {
                              final categorizedData = catagorizeOldNotificationByDate(snapshot.data!.docs);
                              return Obx(
                                    () => IconButton(
                                    icon: Badge(
                                      textStyle: const TextStyle(fontSize: 12),
                                      label: Text("$categorizedData"),
                                      isLabelVisible: (categorizedData != 0 )? true : false ,
                                      child: Icon(Iconsax.notification,
                                        color: Colors.white,
                                        size: 30,
                                        semanticLabel: controller.isNewNotification.value.toString(),
                                      ),
                                    ),
                                    onPressed: (){
                                      setState(() {
                                        controller.zeroCountNoti();
                                        controller.notNewNotification();
                                        dateOldNotificationByDate(snapshot.data!.docs);
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationPageView()));
                                    }),
                              );
                      
                          }
                          }),
                    )
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                          color: MColor.primary,
                          border: Border(
                            top: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                          )
                      ),
                      child: curvedEdgeWidget(
                        child: Column(
                          children: [
                            //This is AppBar
                            SizedBox(height: 116.h,),
                            // Search bar & Horizontal ListView

                            //Search bar
                            ContainerSearchBar(text: AppLocalizations.of(context)!.searchInformation,
                              child: const SearchPageView(),),
                            SizedBox(height: 16.h,),

                            // Title List view and button show all.
                            ButtonTitle(title: translation(context).menu, showViewAllButton: false , colorTitle: Colors.white,),

                            // Horizontal Listview
                            SizedBox(height: 30.h,),
                            const HorizontalMenuListView()
                          ],
                        ),
                      ),
                    )
                ),
              ),
              const SliverToBoxAdapter(child: HorizontalSlideImage(),),
              SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
              // News 1  (News and title)
              SliverToBoxAdapter(child: ButtonTitle(title: AppLocalizations.of(context)!.topic1, showViewAllButton: true , colorTitle: Colors.black,)),

              SliverToBoxAdapter(child: SizedBox(height: 16.h,)),

              SliverToBoxAdapter(child: NewsHomePage(scrollDirection: Axis.horizontal,imgURLs: newsData[0].imgUrls, newsTitle: newsData[0].titles, supTitle: newsData[0].supTitle,onPressed: newsData[0].onPressed,)),

              // News 2  (News and title)
              SliverToBoxAdapter(child:ButtonTitle(title:AppLocalizations.of(context)!.topic2, showViewAllButton: true , colorTitle: Colors.black,)),

              SliverToBoxAdapter(child: SizedBox(height: 16.h,)),
              SliverToBoxAdapter(child: NewsHomePage(scrollDirection: Axis.horizontal,imgURLs: newsData[0].imgUrls, newsTitle: newsData[0].titles, supTitle: newsData[0].supTitle,onPressed: newsData[0].onPressed,)),
            ],
          ),
          _isButtonVisible ? Container(
            padding: EdgeInsets.only(bottom: 32.h),
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: MColor.primary,
                  ),
                  child: const Icon(Icons.arrow_upward, color: Colors.white,)
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}


