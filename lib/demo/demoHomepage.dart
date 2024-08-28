import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'demoFirebaseApi.dart';

class NotificationAppBar extends StatefulWidget {
  @override
  _NotificationAppBarState createState() => _NotificationAppBarState();
}

class _NotificationAppBarState extends State<NotificationAppBar> {
  bool _hasNewNotification = false;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('NotificationData').snapshots().listen((snapshot) {
      if (snapshot.docChanges.isNotEmpty) {
        setState(() {
          _hasNewNotification = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Icon Example'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.notifications),
                if (_hasNewNotification)
                  Positioned(
                    right: 0,
                    child: Icon(
                      Icons.brightness_1,
                      color: Colors.red,
                      size: 8,
                    ),
                  ),
              ],
            ),
            onPressed: () {
              setState(() {
                _hasNewNotification = false;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Trang chính của bạn'),
      ),
    );
  }
}
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  print("-------------------------------- Background message ---------------");
  print("Handling a background message ${message.messageId}");
}
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    print("------------------ Message is------------------");
    print("Message Data: ${remoteMessage.data}");
  });
  runApp(
      MaterialApp( // Sử dụng MaterialApp ở đây để cung cấp Directionality
        home: NotificationAppBar(),
      )
  );
}


