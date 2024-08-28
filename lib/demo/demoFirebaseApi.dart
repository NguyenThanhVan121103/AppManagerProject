import 'package:appmanager/demo/demoPushNotification.dart';
import 'package:appmanager/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handBackgroupMessage(RemoteMessage message) async{
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("data: ${message.data}");
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState?.pushNamed(
      NotificationScreen.route,
      arguments: message.data,
    );
  }

  Future initPushNotifications() async{
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handBackgroupMessage);
  }

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fcMToken = await _firebaseMessaging.getToken();
    print("Token: $fcMToken");
    initPushNotifications();
  }
}