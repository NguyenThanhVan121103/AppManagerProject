import 'package:appmanager/src/common_widgets/custom_shape/widgets/appBar/homeAppBarWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/heading/customHeadingWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/horizontalListview/homeHorizontalListviewWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/imageContainer/horizontalImageWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/news/newsHomePage.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/searchBar/searchBarWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/titleMenuButton/titleMenuWidget.dart';
import 'package:appmanager/src/features/screen/models/demoDB.dart';
import 'package:flutter/material.dart';


class homePageView extends StatelessWidget {
  const homePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const customHeadingContainer(
              child: Column(

                children: [
                  //This is AppBar
                  HomePageAppBar(),
                  SizedBox(height: 16,),
                  // Search bar & Horizontal ListView

                  //Search bar
                  searchBarWidget(text: 'Search information',),
                  SizedBox(height: 16,),

                  // Title List view and button show all.
                  title_buttonWidget(title: 'Menu', showViewAllButton: false , colorTitle: Colors.white,),

                  // Horizontal Listview
                  SizedBox(height: 30,),
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



