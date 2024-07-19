import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class searchPageView extends StatefulWidget {
  const searchPageView({super.key});

  @override
  State<searchPageView> createState() => _searchPageViewState();
}

class _searchPageViewState extends State<searchPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(showBackArrows: true, title: CupertinoSearchTextField(prefixIcon: Icon(Iconsax.search_normal,), suffixIcon: Icon(Iconsax.close_circle,)),),
      body: Container(decoration: BoxDecoration(color: Colors.white),),
    );
  }
}
