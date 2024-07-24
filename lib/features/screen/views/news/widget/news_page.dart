import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/news/topicNewsWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/searchBar/searchPageWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common_widgets/custom_shape/widgets/refreshIndicatorWidget/widget/refreshIndicatorWidget.dart';

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
        //Appbar
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

        //Tab barr & content
        body: TabBarView(
          children: [
            refreshIndicatorWidget(refreshIndicator: _refreshIndicatorTopic1, child:const topicNewsWidget() ,),
            refreshIndicatorWidget(refreshIndicator: _refreshIndicatorTopic2, child:const topicNewsWidget()),
            refreshIndicatorWidget(refreshIndicator: _refreshIndicatorTopic3, child:const topicNewsWidget()),
          ],
      )
      ),
    );
  }
}



