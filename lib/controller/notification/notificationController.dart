import 'package:appmanager/classes/countNotification/countNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:googleapis/driveactivity/v2.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotificationController extends GetxController{
  final isNewNotification = false.obs;
  final datePushNoti = DateTime.utc(2024,27,8).obs;
  final countNoti = 0.obs;

  void newNotification(){
    isNewNotification.value = true;
  }
  void notNewNotification(){
    isNewNotification.value = false;
  }
  void addCountNoti() async{
    countNoti.value += 1;
    await LocalCountNotification.setCountNoti(countNoti.value);
  }

  void zeroCountNoti() async{
    countNoti.value = 0;
    await LocalCountNotification.setCountNoti(countNoti.value);

  }

  void updateDate(DateTime date){
    datePushNoti.value = date;
  }

}