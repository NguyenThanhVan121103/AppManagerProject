import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    this.title,
    this.showBackArrows = false,
    this.showTabBar = false,
    this.lendingIcon,
    this.lendingOnPressed,
    this.action,
    this.colorIcon,
    this.backOnTap,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
    this.title1,
    this.title2,
    this.title3,
    this.heightAppBar =60,
  });

  final Widget? title;
  final bool showBackArrows, showTabBar;
  final IconData? lendingIcon;
  final List<Widget>? action;
  final VoidCallback? lendingOnPressed;
  final Color? colorIcon, backgroundColor;
  final Widget? backOnTap;
  final EdgeInsetsGeometry padding;
  final String? title1,title2,title3;
  final double heightAppBar;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AppBar(
        backgroundColor:  backgroundColor,
        // I want custom appbar
        automaticallyImplyLeading: false,
        leading: showBackArrows
            ? IconButton(onPressed: () => Get.back(), icon:  Icon(Iconsax.arrow_left, color:colorIcon,))
        : lendingIcon != null ? IconButton(onPressed: (){}, icon: Icon(lendingIcon, color: colorIcon,)) : null,
      title: title,
        actions: action,
        bottom: showTabBar ? TabBar(
          unselectedLabelColor: MColor.third,
          indicatorColor: MColor.third,
          dividerColor: Colors.grey,
          labelColor: MColor.third,
          tabs: [
              Tab(text: title1, ),
              Tab(text: title2,),
              Tab(text: title3,),],) : null,
      )
    );
  }

  @override
  // implement preferredSize.
  Size get preferredSize => Size.fromHeight(heightAppBar);
}
