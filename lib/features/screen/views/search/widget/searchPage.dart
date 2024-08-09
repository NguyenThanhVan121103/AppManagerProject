import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(showBackArrows: true, title: CupertinoSearchTextField(padding: EdgeInsets.all(10),prefixIcon: Icon(Iconsax.search_normal,), suffixIcon: Icon(Iconsax.close_circle,), placeholder: "Search...",),),
      body: Container(decoration: BoxDecoration(color: Colors.white),),
    );
  }
}
