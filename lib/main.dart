import 'package:appmanager/common_widgets/custom_shape/widgets/navigationBar/navigationMenu.dart';
import 'package:appmanager/features/screen/views/account/widget/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp( const MaterialRun());
}

class AppManager extends StatelessWidget {
  const AppManager({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
          designSize: const Size(412,915),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, child) => GetMaterialApp(
            builder: (context, widget) {
              return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: navigationMenu());
            },
            debugShowCheckedModeBanner: true,
            locale: const Locale('vi'),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
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


class MaterialRun extends StatelessWidget {
  const MaterialRun({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
          home: navigationMenu(),
        );
  }
}






