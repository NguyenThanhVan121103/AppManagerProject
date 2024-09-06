import 'package:appmanager/classes/selectedAccountLink/localSelectedAccountLink.dart';
import 'package:appmanager/classes/selectedLanguage/localSelectedLanguage.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/demo/demoAddData.dart';
import 'package:appmanager/demo/demoFirebaseApi.dart';
import 'package:appmanager/demo/demoPushNotification.dart';
import 'package:appmanager/features/authentication/views/signUpPage.dart';
import 'package:appmanager/features/screen/views/notification/widget/addNotification_page.txt';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'classes/countNotification/countNotification.dart';
import 'controller/notification/notificationController.dart';


final navigatorKey = GlobalKey<NavigatorState>();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  print("-------------------------------- Background message ---------------");
  print("Handling a background message ${message.messageId}");

  await Firebase.initializeApp();
  // Cập nhật giá trị countNoti khi nhận được thông báo
  NotificationController controller = Get.put(NotificationController());
  controller.addCountNoti();
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
  await LocalSelectedLanguage.init();
  await LocalCountNotification.init();
  await LocalSelectedAccountLink.init();

  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    print("------------------ Message is------------------");
    print("Message Data: ${remoteMessage.data}");
  });
  runApp(AppManager());
}


class AppManager extends StatefulWidget {
  const AppManager({super.key});

  @override
  State<AppManager> createState() => _AppManagerState();

  static void setLocale(BuildContext context, Locale newLocale){
    _AppManagerState? state = context.findAncestorStateOfType<_AppManagerState>();
    state?.setLocale(newLocale);
  }
}

class _AppManagerState extends State<AppManager> {
  Locale? _locale;

  setLocale(Locale locale){
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDepandencies(){
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
          designSize: const Size(412,915),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) => GetMaterialApp(
            debugShowMaterialGrid: false,
            // home: accountPageView(),
            // home: SavedPostPageView(),
            // home: SettingUpdatePasswordPageView(),
            // home: AddNotificationPageView(),
            home: SignUpPageView(),
            debugShowCheckedModeBanner: false,
            locale: _locale,
            localizationsDelegates:const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('vi')
            ],
          )
          );
}








