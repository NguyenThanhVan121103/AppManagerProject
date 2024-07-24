import 'package:appmanager/common_widgets/custom_shape/widgets/account/functionAccountWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/heading/accountHeadingWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/horizontalListview/homeHorizontalListviewWidget.dart';
import 'package:appmanager/features/screen/views/account/widget/editProfile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class accountPageView extends StatelessWidget {
  const accountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Heading
            const accountHeadingWidget(imgURL: 'assets/images/maleAvatar.png', nameUser: 'Nguyễn Thành Văn', numberPhone: "+846542281515", onPressed: editProfilePageView(),),

            // My Activites
            Text("My Activities", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
            SizedBox(height: 14.sp,),

            const functionAccountWidget(icon: Iconsax.save_2, titleButton: "Saved post",),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            const functionAccountWidget(icon: Icons.chat_bubble_outline, titleButton: "My comment",),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            const functionAccountWidget(icon: Iconsax.like, titleButton: "Liked post",),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            const functionAccountWidget(icon: Iconsax.link, titleButton: "Account link",),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),

            //My Services
            const Text("My Services", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 14.sp,),

            const homeHorizontalListviewWidget(color: Colors.greenAccent, colorTitle: Colors.black,),
            SizedBox(height: 14.sp,),

            //Support information
            Text("Support information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp), ),
            SizedBox(height: 14.sp,),

            const functionAccountWidget(icon: Icons.wechat_outlined, titleButton: "Frequently asked questions",colorIcon: Colors.grey,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            const functionAccountWidget(icon: Iconsax.shield_tick, titleButton: "Privacy Policy", colorIcon: Colors.grey,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            const functionAccountWidget(icon: Icons.support_agent, titleButton: "Support", colorIcon: Colors.grey, ),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),

            //Version is here
            Text("Version 0.1", style: TextStyle( fontSize: 10.sp), ),

          ],
        ),
      ),
    );
  }
}

