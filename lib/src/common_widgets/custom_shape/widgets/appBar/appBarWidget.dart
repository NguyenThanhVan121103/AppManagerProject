import 'package:appmanager/src/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MAppBar({
    super.key,
    this.title,
    this.showBackArrows = false,
    this.lendingIcon,
    this.lendingOnPressed,
    this.action,
    this.colorIcon,
    this.backOnTap,
  });

  final Widget? title;
  final bool showBackArrows;
  final IconData? lendingIcon;
  final List<Widget>? action;
  final VoidCallback? lendingOnPressed;
  final Color? colorIcon;
  final Widget? backOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: MColor.primary.withOpacity(0.1),
        // I want custom appbar
        automaticallyImplyLeading: false,
        leading: showBackArrows
            ? IconButton(onPressed: () => Get.back(), icon:  Icon(Iconsax.arrow_left, color:colorIcon,))
        : lendingIcon != null ? IconButton(onPressed: (){}, icon: Icon(lendingIcon, color: colorIcon,)) : null,
      title: title,
        actions: action
      )
    );
  }

  @override
  // implement preferredSize.
  Size get preferredSize => const Size.fromHeight(30);
}
