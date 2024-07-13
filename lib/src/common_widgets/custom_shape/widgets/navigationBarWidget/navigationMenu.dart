import 'package:appmanager/src/features/screen/views/home/widget/home_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class navigationMenu extends StatelessWidget {
  navigationMenu({super.key});
  final controller = NavigationControlelr();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.SelectedIndex.value, //Listening Value
          onDestinationSelected: (index) => controller.SelectedIndex.value = index,
          destinations: const[
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.notification), label: "Notificaion"),
            NavigationDestination(icon: Icon(Iconsax.note), label: "News"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Account"),
          ],
        ),
      ),
      body: Obx(() =>  controller.screems[controller.SelectedIndex.value]),
    );
  }
}

class NavigationControlelr extends GetxController {
  final Rx<int>SelectedIndex = 0.obs;

  final screems = [
    const homePageView(),
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.green)];

}
