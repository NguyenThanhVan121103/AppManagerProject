import 'package:appmanager/features/screen/views/setting/widget/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

import '../../../../constants/constColor.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      backgroundColor: Color(0xFF1565C0).withOpacity(0.1),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hello, Good day!!!",
            style: TextStyle(
              fontSize: 15.sp,
              color: MColor.third,
            ),
          ),
          Text(
            'Nguyen Thanh Van',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: MColor.third,
            ),
          )
        ],
      ),
      action: [
        IconButton(
            icon: const Icon(
              Iconsax.setting,
              color: Colors.white,
            ),
            onPressed: ()=> Get.to(const SettingPageView()))
      ],
    );
  }
}

