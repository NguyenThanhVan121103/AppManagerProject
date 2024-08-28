import 'package:appmanager/features/screen/views/search/widget/searchPage.dart';
import 'package:get/get.dart';

import '../../demo/demo.dart';
import '../../features/screen/views/account/widget/account_page.dart';
import '../../features/screen/views/home/widget/homePage.dart';
import '../../features/screen/views/news/widget/news_page.dart';

class NavigationControlelr extends GetxController {
  final Rx<int>SelectedIndex = 0.obs;

  final screems = [
    const HomePageView(),
    const SearchPageView(),
    const newsPageView(),
    const accountPageView(),
  ];

}