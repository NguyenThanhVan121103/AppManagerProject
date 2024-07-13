import 'package:appmanager/src/common_widgets/custom_shape/widgets/appBar/homeAppBarWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/heading/customHeadingWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/searchBar/searchBarWidget.dart';
import 'package:appmanager/src/common_widgets/custom_shape/widgets/titleMenuButtonWidget/titleMenuWidget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class homePageView extends StatelessWidget {
  const homePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customHeadingContainer(
              child: Column(

                children: [
                  //This is AppBar
                  HomePageAppBar(),
                  SizedBox(height: 16,),
                  // Search bar & Horizontal ListView

                  //Search bar
                  searchBarWidget(text: 'Search information',),
                  SizedBox(height: 16,),

                  // Horizontal Listview
                  title_buttonWidget(title: 'Menu', showViewAllButton: false , colorTitle: Colors.white,),

                ],
              )
            )
          ],

        ),
      ),
    );
  }
}

