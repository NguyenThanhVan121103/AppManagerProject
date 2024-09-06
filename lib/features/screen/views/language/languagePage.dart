import 'dart:ffi';

import 'package:appmanager/classes/selectedLanguage/localSelectedLanguage.dart';
import 'package:appmanager/common_widgets/widget/navigationbar/navigationMenu.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/controller/loading/loadingController.dart';
import 'package:appmanager/database/language_DB/language_data.dart';
import 'package:appmanager/models/language/languageModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:flutter/material.dart';

import '../../../../common_widgets/widget/button/buttonLanguage.dart';
import '../../../../main.dart';


class LanguagePageView extends StatefulWidget {
  const LanguagePageView({super.key});

  @override
  State<LanguagePageView> createState() => _LanguagePageViewState();
}

class _LanguagePageViewState extends State<LanguagePageView> with TickerProviderStateMixin {
  late List<bool> isSelected = languageData.map((e) => false).toList();
  final LoadingController loadingController = Get.put(LoadingController());
  int? index = LocalSelectedLanguage.getSetlectedLanguage();

  @override
  void initState() {
    super.initState();
    if (index != null) {
      _isSelected(index!);
    } else{
      LocalSelectedLanguage.setSetlectedLanguage(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        title: Text(translation(context).language, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        iconColor: Colors.white,
        backgroundColor: MColor.primary,
      ),
      body: Container(
        color: Colors.grey[200],
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  _isSelected(index);
                  _showBottomSheet(index);
                  // _isSelectedLanguage(index);

                  },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Divider(height: 0),
                        SizedBox(height: 8),
                        ButtonLanguage(title: languageData[index].name, isSelected: isSelected[index]),
                        SizedBox(height: 8),
                        Divider(height: 0),
                      ],
                    ),
                  ),
                ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(height: 0),
          itemCount: languageData.length,
        ),
      ),
    );
  }

  _isSelected(int index) async{
    await LocalSelectedLanguage.setSetlectedLanguage(index);
    setState(() {
      isSelected = languageData.map((e) => false).toList();
      isSelected[index] = true;
    });
  }

  _isLanguage(int index) async {
    languageModel language = languageData[index];
    if (language != null) {
      Locale _locale = await setLocale(language.languageCode);
      AppManager.setLocale(context, _locale);
    }
  }


  void _showBottomSheet(index) async{
    index = LocalSelectedLanguage.getSetlectedLanguage();
      Get.bottomSheet(
        Container(
          height: 150.h,
          padding: EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Changing Language...',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(height: 16),
              LinearProgressIndicator(color: Colors.green,)
            ],
          ),
        ),
      );
      // Tự động đóng BottomSheet sau 5 giây
      Future.delayed(Duration(seconds: 5), () {
        if (Get.isBottomSheetOpen ?? false) {
          _isLanguage(index);
          Navigator.push(context, MaterialPageRoute(builder: (context) => navigationMenu()));
        }
      });
    }
}


