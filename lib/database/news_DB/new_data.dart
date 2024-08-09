import 'package:appmanager/models/news/newsModel.dart';

import '../../features/screen/views/news/widget/newsDemoPage.dart';

List<newsModel> newsData = [
  newsModel(imgUrls: "assets/images/1000x500.png", titles: 'Title 1', supTitle: 'Sup title 1', onPressed: const newsDemoPageView()),
  newsModel(imgUrls: "assets/images/1000x500.png", titles: 'Title 2', supTitle: 'Sup title 2', onPressed: const newsDemoPageView()),
  newsModel(imgUrls: "assets/images/1000x500.png", titles: 'Title 3', supTitle: 'Sup title 3', onPressed: const newsDemoPageView()),
];