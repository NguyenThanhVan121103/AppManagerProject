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
    this.action
  });

  final Widget? title;
  final bool showBackArrows;
  final IconData? lendingIcon;
  final List<Widget>? action;
  final VoidCallback? lendingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
        backgroundColor: MColor.primary.withOpacity(0.1),
        // I want custom appbar
        automaticallyImplyLeading: false,
        leading: showBackArrows
            ? IconButton(onPressed: () => Get.back(), icon: const Icon(Iconsax.arrow_left, color: MColor.third,))
        : lendingIcon != null ? IconButton(onPressed: (){}, icon: Icon(lendingIcon)) : null,
      title: title,
        actions: action
      )
    );
  }

  @override
  // implement preferredSize.
  Size get preferredSize => const Size.fromHeight(30);
}
