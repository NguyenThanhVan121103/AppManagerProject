import 'package:appmanager/controller/notification/notificationController.dart';
import 'package:appmanager/features/screen/views/account/widget/account_page.dart';
import 'package:appmanager/features/screen/views/home/widget/homePage.dart';
import 'package:appmanager/features/screen/views/news/widget/news_page.dart';
import 'package:appmanager/features/screen/views/notification/widget/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/navigation/navigationController.dart';


class navigationMenu extends StatefulWidget {
  navigationMenu({
    super.key,
    this.newIndex = 0,
  });
  final int newIndex;

  @override
  State<navigationMenu> createState() => _navigationMenuState();
}

class _navigationMenuState extends State<navigationMenu> {
  final controller = NavigationControlelr();

  final notiController = NotificationController();
  late IconData iconNotification;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Obx(
              () => NavigationBar(
            height: 60,
            elevation: 0,
            selectedIndex: controller.SelectedIndex.value, //Listening Value
                onDestinationSelected: (index) => {
                  if (widget.newIndex == 0) controller.SelectedIndex.value = index : index = widget.newIndex  ,
                },
            destinations: [
              NavigationDestination(icon: Tooltip(message: AppLocalizations.of(context)!.home,child: Icon(Iconsax.home)), label: AppLocalizations.of(context)!.home),
              NavigationDestination(icon:Tooltip(message: AppLocalizations.of(context)!.notification, child:Icon(Iconsax.search_normal)), label: AppLocalizations.of(context)!.search),
              NavigationDestination(icon: Tooltip(message: AppLocalizations.of(context)!.news,child: Icon(Iconsax.note)), label: AppLocalizations.of(context)!.news),
              NavigationDestination(icon: Tooltip(message: AppLocalizations.of(context)!.account,child: Icon(Iconsax.user)), label: AppLocalizations.of(context)!.account),
            ],
          ),
        ),
        body: Obx(() => controller.screems[controller.SelectedIndex.value])
    );
  }
}
