import 'package:appmanager/features/screen/views/search/widget/searchPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spwidget/common_widgets/widget/container/searchBar.dart';


import '../../../../../common_widgets/widget/appbar/homeAppBarWidget.dart';
import '../../../../../common_widgets/widget/button/buttonTitle.dart';
import '../../../../../common_widgets/widget/heading/curvedEdge.dart';
import '../../../../../common_widgets/widget/image/imageSlider.dart';
import '../../../../../common_widgets/widget/listview/listviewMenu.dart';
import '../../../../../common_widgets/widget/listview/listviewNewsShort.dart';
import '../../../../../database/news_DB/new_data.dart';


class homePageView extends StatefulWidget {
  const homePageView({super.key});

  @override
  State<homePageView> createState() => _homePageViewState();
}

class _homePageViewState extends State<homePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            curvedEdgeWidget(
              child: Column(

                children: [
                  //This is AppBar
                  const HomePageAppBar(),
                  SizedBox(height: 16.sp,),
                  // Search bar & Horizontal ListView

                  //Search bar
                  const ContainerSearchBar(text: 'Search Infomation', child: SearchPageView(),),
                  SizedBox(height: 16.sp,),

                  // Title List view and button show all.
                  const buttonTitle(title: 'Menu', showViewAllButton: false , colorTitle: Colors.white,),

                  // Horizontal Listview
                  SizedBox(height: 30.sp,),
                  const HorizontalMenuListView()
                ],
              ),
            ),

            // body (Content, Listview, Gridview)
            const HorizontalSlideImage(),
            const SizedBox(height: 16,),

            // News 1  (News and title)
            const buttonTitle(title: 'Topic 1', showViewAllButton: true , colorTitle: Colors.black,),

            const SizedBox(height: 16,),

            NewsHomePage(scrollDirection: Axis.horizontal,imgURLs: newsData[0].imgUrls, newsTitle: newsData[0].titles, supTitle: newsData[0].supTitle,onPressed: newsData[0].onPressed,),

            // News 2  (News and title)
            const buttonTitle(title: 'Topic 2', showViewAllButton: true , colorTitle: Colors.black,),

            const SizedBox(height: 16,),

            NewsHomePage(
              scrollDirection: Axis.horizontal,
              imgURLs: newsData[1].imgUrls,
              newsTitle: newsData[1].titles,
              supTitle: newsData[1].supTitle,
              onPressed: newsData[1].onPressed,
            ),


          ],
        ),
      ),
    );
  }
}



