import 'dart:ffi';

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

  @override
  void initState() {
    super.initState();
    _isSelectedLanguage();
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

  _isSelected(int index) {
    setState(() {
      isSelected = languageData.map((e) => false).toList();
      isSelected[index] = true;
    });
  }

  _isLanguage(int index) async {
    languageModel language = languageData[index];

    // Bắt đầu loading với thời gian 5 giây
    _showBottomSheet();
    print(loadingController.isLoading);
    loadingController.isLoading.listen((isLoading) {
      if (!isLoading) {
        Navigator.of(context).pop(); // Đóng BottomSheet khi isLoading là false
      }
    });
    print(loadingController.isLoading);

    if (language != null) {
      Locale _locale = await setLocale(language.languageCode);
      AppManager.setLocale(context, _locale);
    }
  }

  _isSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString('languageCode');

    if (savedLanguageCode != null) {
      int index = languageData.indexWhere((lang) => lang.languageCode == savedLanguageCode);
      if (index != -1) {
        setState(() {
          isSelected = languageData.map((e) => false).toList();
          isSelected[index] = true;
        });
        _isLanguage(index);
      }
    } else {
      isSelected[0] = true;
      _isLanguage(0);
    }
  }
  Future<void> LoadingLanguage(int index)async {
    loadingController.startLoading();
    try{
      _isSelectedLanguage();
    }catch (e){
      _isLanguage(index);
      _isSelected(index);
      print(e);
    }finally{
      loadingController.stopLoading();
    }

  }

  void _showBottomSheet() {
    Get.bottomSheet(
      Obx(() => Container(
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
      )),
    );
  }
}