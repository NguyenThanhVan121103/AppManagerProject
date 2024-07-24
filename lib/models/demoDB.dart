
// Data demo of News in Home

//News 1

import 'package:appmanager/features/screen/views/news/widget/newsDemoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

// newsHorizontal

class DataNews{
  String imgUrls;
  String titles;
  String supTitle;
  Widget onPressed;
  DataNews({
    required this.imgUrls,
    required this.titles,
    required this.supTitle,
    required this.onPressed
});}

List<DataNews> overviewNews = [
  DataNews(imgUrls: "assets/images/1000x500.png", titles: 'Title 1', supTitle: 'Sup title 1', onPressed: newsDemoPageView()),
  DataNews(imgUrls: "assets/images/1000x500.png", titles: 'Title 2', supTitle: 'Sup title 2', onPressed: newsDemoPageView()),
  DataNews(imgUrls: "assets/images/1000x500.png", titles: 'Title 3', supTitle: 'Sup title 3', onPressed: newsDemoPageView()),
];

// horizontal Menu

class horizontalMenu{
  String titles;
  IconData icons;

  horizontalMenu({
    required this.titles,
    required this.icons,
});
}

List<horizontalMenu> dataMenu = [
  horizontalMenu (
      titles: 'Schedule', icons: Iconsax.calendar,
  ),
  horizontalMenu(
  titles:'Debt',
  icons: Iconsax.money_send,
  ),
  horizontalMenu(
  titles: 'Contracts',
  icons: Iconsax.barcode
  ),
];

