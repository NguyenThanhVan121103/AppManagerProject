import 'package:appmanager/features/screen/views/account/widget/account_page.dart';
import 'package:appmanager/features/screen/views/home/widget/home_page.dart';
import 'package:appmanager/features/screen/views/news/widget/news_page.dart';
import 'package:appmanager/features/screen/views/notification/widget/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class navigationMenu extends StatelessWidget {
  navigationMenu({
    super.key,
    this.newIndex = 0,
  });
  final controller = NavigationControlelr();
  final int newIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
              () => NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.SelectedIndex.value, //Listening Value
            onDestinationSelected: (index) => {
              if (newIndex == 0) controller.SelectedIndex.value = index : index = newIndex  ,
            },
            destinations: const[
              NavigationDestination(icon: Tooltip(message: "Home",child: Icon(Iconsax.home)), label: "Home"),
              NavigationDestination(icon: Tooltip(message: "Notification",child: Icon(Iconsax.notification)), label: "Notification"),
              NavigationDestination(icon: Tooltip(message: "News",child: Icon(Iconsax.note)), label: "News"),
              NavigationDestination(icon: Tooltip(message: "Account",child: Icon(Iconsax.user)), label: "Account"),
            ],
          ),
        ),
        body: Obx(() => controller.screems[controller.SelectedIndex.value])
    );
  }
}

class NavigationControlelr extends GetxController {
  final Rx<int>SelectedIndex = 0.obs;

  final screems = [
    const homePageView(),
    const notificationPageView(),
    const newsPageView(),
    const accountPageView(),
  ];

}