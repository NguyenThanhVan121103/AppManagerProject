import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/features/authentication/views/settingUpdatePasswordPage.dart';
import 'package:appmanager/features/authentication/views/signInPage.dart';
import 'package:appmanager/features/screen/views/language/languagePage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:flutter/material.dart';

import '../../../../../common_widgets/widget/button/buttonFunctionAccount.dart';


class SettingPageView extends StatelessWidget {
  const SettingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(showBackArrows: true, title: Text(translation(context).setting, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        iconColor: Colors.white,
        backgroundColor: MColor.primary,
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: 8,),
              FunctionAccountWidget(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePageView()));},titleButton: translation(context).selectLanguage, backgroundColor: Colors.white,),
              Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
              FunctionAccountWidget(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => SettingUpdatePasswordPageView()));},titleButton: translation(context).updatePassword, backgroundColor: Colors.white,),
              Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
              FunctionAccountWidget(onPressed: (){Get.off(() => SignInPageView());},titleButton: translation(context).logOut,backgroundColor: Colors.white,),
            ]))
          ],
        ),
      ),

    );
  }
}
