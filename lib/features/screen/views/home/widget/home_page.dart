import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/homeAppBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/heading/customHeadingWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/horizontalListview/homeHorizontalListviewWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/imageContainer/horizontalImageWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/news/newsHomePage.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/searchBar/searchBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/titleMenuButton/titleMenuWidget.dart';
import 'package:appmanager/models/demoDB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
            customHeadingContainer(
              child: Column(

                children: [
                  //This is AppBar
                  HomePageAppBar(),
                  SizedBox(height: 16.sp,),
                  // Search bar & Horizontal ListView

                  //Search bar
                  searchBarWidget(text: 'Search information',),
                  SizedBox(height: 16.sp,),

                  // Title List view and button show all.
                  title_buttonWidget(title: 'Menu', showViewAllButton: false , colorTitle: Colors.white,),

                  // Horizontal Listview
                  SizedBox(height: 30.sp,),
                  homeHorizontalListviewWidget()
                ],
              ),
            ),

            // body (Content, Listview, Gridview)
            const horizontalImage(),
            const SizedBox(height: 16,),

            // News 1  (News and title)
            const title_buttonWidget(title: 'Title1', showViewAllButton: true , colorTitle: Colors.black,),

            const SizedBox(height: 16,),

            newsHomePage(imgURLs: imgURLs, newsTitle: newsTitle, supTitle: suptitle,onPressed: onPressed,),

            // News 2  (News and title)
            const title_buttonWidget(title: 'Title2', showViewAllButton: true , colorTitle: Colors.black,),

            const SizedBox(height: 16,),

            newsHomePage(imgURLs: imgURLs, newsTitle: newsTitle, supTitle: suptitle,onPressed: onPressed,),


          ],
        ),
      ),
    );
  }
}



