import 'package:appmanager/common_widgets/widget/navigationbar/navigationMenu.dart';
import 'package:appmanager/demo/demoScrollView.dart';
import 'package:appmanager/features/screen/views/contract/widget/addContractPage.dart';
import 'package:appmanager/features/screen/views/contract/widget/contractPage.dart';
import 'package:appmanager/features/screen/views/news/widget/news_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'demo/demo.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(AppManager());
}


class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
          designSize: const Size(412,915),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) => GetMaterialApp(
            // home: DemoScroll(),
            // home: navigationMenu(),
            home: newsPageView(),
            // home:demo(),
            debugShowCheckedModeBanner: true,
            locale: Locale('vi'),
            localizationsDelegates: [
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








