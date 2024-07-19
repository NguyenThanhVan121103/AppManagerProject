import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/news/topicNewsWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/searchBar/searchPageWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/models/demoDB.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class newsPageView extends StatefulWidget {
  const newsPageView({super.key});

  @override
  State<newsPageView> createState() => _newsPageViewState();
}

class _newsPageViewState extends State<newsPageView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorTopic1 = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorTopic2 = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorTopic3 = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MAppBar(
          backgroundColor: MColor.primary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('News', style: TextStyle(color: MColor.third, fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){Get.to(const searchPageView());}, icon: const Icon(Iconsax.search_normal, color: Colors.white,))
              ],
          ),
          showTabBar: true,
          title1: 'Topic 1',
          title2: 'Topic 2',
          title3: 'Topic 3',
          heightAppBar: 100,
        ),
        body: TabBarView(
          children: [
            RefreshIndicator(
                key: _refreshIndicatorTopic1,
                onRefresh: () async{
                  return Future<void>.delayed(const Duration(seconds: 2));
                },
                child: const topicNewsWidget()
            ),
            RefreshIndicator(
                key: _refreshIndicatorTopic2,
                onRefresh: () async{
                  return Future<void>.delayed(const Duration(seconds: 2));
                },
                child: const topicNewsWidget()
            ),
            RefreshIndicator(
                key: _refreshIndicatorTopic3,
                onRefresh: () async{
                  return Future<void>.delayed(const Duration(seconds: 2));
                },
                child: const topicNewsWidget()
            ),
          ],
      )
      ),
    );
  }
}

