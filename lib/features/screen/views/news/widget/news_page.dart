import 'package:appmanager/common_widgets/widget/heading/persistentHeader.dart';
import 'package:appmanager/common_widgets/widget/image/imageSlider.dart';
import 'package:appmanager/constants/languageConstants.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:appmanager/features/screen/views/search/widget/searchPage.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

import '../../../../../common_widgets/widget/container/containerNew.dart';
import '../../../../../common_widgets/widget/container/containerTitle.dart';
import '../../../../../database/news_DB/newMenu_data.dart';



class newsPageView extends StatefulWidget {
  const newsPageView({super.key});
  @override
  State<newsPageView> createState() => _newsPageViewState();
}

class _newsPageViewState extends State<newsPageView> {

  // Scroll
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;



  void _onScroll(){
    double offset = _scrollController.offset;
    double screenHeight = MediaQuery.of(context).size.height;
    int newIndex = (offset / screenHeight).round();
    if(newIndex != _currentIndex){
      setState(() {
        _currentIndex = newIndex;
      });
      print("*****Newindex: $newIndex,currentIndex; $_currentIndex, offset: $offset, screenHeight: $screenHeight ");

    }
    else {
      _currentIndex = newIndex;
      print("Newindex: $newIndex,currentIndex; $_currentIndex, offset: $offset, screenHeight: $screenHeight ");
    }
  }

  @override
  void initState(){
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose(){
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //Appbar
        appBar: MAppBar(
          backgroundColor: Colors.blue,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(translation(context).news, style: TextStyle(color: MColor.third, fontWeight: FontWeight.bold),),
                IconButton(onPressed: (){Get.to(const SearchPageView());}, icon: const Icon(Iconsax.search_normal, color: Colors.white,))
              ],
          ),
        ),

        //Tab barr & content
        body:Container(
          color: MColor.primary,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[

              const SliverToBoxAdapter(child:HorizontalSlideImage(backgroundColor: Colors.white,)),
              const SliverToBoxAdapter(child: SizedBox(height:  32,)),
              SliverPersistentHeader(pinned: true, delegate:PersistentHeader(currentIndex:  _currentIndex, scrollController: _scrollController), ),
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),


              // Featured News
              ContainerTitle(title: translation(context).featuredNews),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(itemCount: 6,),
              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),

              //Topic 1
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),

              ContainerTitle(title: '${translation(context).topic} 1'),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(),

              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),

              //Topic 2
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),

              ContainerTitle(title: '${translation(context).topic} 2'),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(),
              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),

              //Topic 3
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),

              ContainerTitle(title: '${translation(context).topic} 3'),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(),
              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),

              //Topic 4
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),

              ContainerTitle(title: '${translation(context).topic} 4' ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(),
              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),

              //Topic 4
              const SliverToBoxAdapter(child: SizedBox(height: 32,),),

              ContainerTitle(title: '${translation(context).topic} 5' ),

              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const ContainerNew(),
              const SliverToBoxAdapter(child: SizedBox(height: 16,),),
              SliverToBoxAdapter(child: ButtonNormal(titleButton: ".. ${translation(context).seeMore} ..", colorButton: MColor.primary.withOpacity(0.1),colorBorder: MColor.primary.withOpacity(0.1), heightButton: 30,)),
            ],
          ),
        ),

      ),
    );
  }

}





