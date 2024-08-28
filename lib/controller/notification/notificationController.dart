import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:googleapis/driveactivity/v2.dart';
import 'package:iconsax/iconsax.dart';

class NotificationController extends GetxController{
  final isNewNotification = false.obs;
  final datePushNoti = DateTime.utc(2024,27,8).obs;
  void newNotification(){
    isNewNotification.value = true;
  }
  void notNewNotification(){
    isNewNotification.value = false;
  }

  void updateDate(DateTime date){
    datePushNoti.value = date;
  }

}