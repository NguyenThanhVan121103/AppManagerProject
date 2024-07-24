import 'package:appmanager/common_widgets/custom_shape/widgets/navigationBar/navigationMenu.dart';
import 'package:appmanager/features/screen/views/schedule/widget/calendarDayPageView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const AppManager());
}




class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
          designSize: const Size(412,915),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) => GetMaterialApp(
            home: navigationMenu(),
            debugShowCheckedModeBanner: true,
            locale: const Locale('vi'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('vi')
            ],
          )
          );
}








