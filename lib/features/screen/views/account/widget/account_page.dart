import 'package:appmanager/constants/languageConstants.dart';
import 'package:appmanager/features/personalization/views/accountLinkPage.dart';
import 'package:appmanager/features/personalization/views/likedPostPage.dart';
import 'package:appmanager/features/personalization/views/privacyPolicyPage.dart';
import 'package:appmanager/features/personalization/views/questionsPage.dart';
import 'package:appmanager/features/personalization/views/savedPostPage.dart';
import 'package:appmanager/features/personalization/views/supportPage.dart';
import 'package:appmanager/features/screen/views/account/widget/editProfile_page.dart';
import 'package:appmanager/features/screen/views/setting/widget/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common_widgets/widget/button/buttonFunctionAccount.dart';
import '../../../../../common_widgets/widget/heading/headingAccount.dart';
import '../../../../../common_widgets/widget/listview/listviewMenu.dart';
import '../../../../personalization/views/myCommentPage.dart';



class accountPageView extends StatelessWidget {
  const accountPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Heading
            const AccountHeadingWidget(imgURL: 'assets/images/maleAvatar.png', nameUser: 'Nguyễn Thành Văn', numberPhone: "+846542281515", onPressed: EditProfilePageView(),),

            // My Activites
            Text(translation(context).myActivites, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),),
            SizedBox(height: 14.sp,),

            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => SavedPostPageView()));} , icon: Iconsax.save_2, titleButton: translation(context).savedPost,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => MyCommentPageView()));},icon: Icons.chat_bubble_outline, titleButton: translation(context).myComment,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => LikedPostPageView()));},icon: Iconsax.like, titleButton: translation(context).savedPost,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => AccountLinkPageView()));},icon: Iconsax.link, titleButton: translation(context).accountLink,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),

            //My Services
            Text(translation(context).myServices, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 14.sp,),

            const HorizontalMenuListView(color: Colors.greenAccent, colorTitle: Colors.greenAccent,),
            SizedBox(height: 14.sp,),

            //Support information
            Text(translation(context).supportInformation, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp), ),
            SizedBox(height: 14.sp,),

            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsPageView()));},icon: Icons.wechat_outlined, titleButton: translation(context).frequentlyAskedQuestions,colorIcon: Colors.grey,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPageView()));},icon: Iconsax.shield_tick, titleButton: translation(context).privacyPolicy, colorIcon: Colors.grey,),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => SupportPageView()));},icon: Icons.support_agent, titleButton: translation(context).support, colorIcon: Colors.grey, ),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),
            FunctionAccountWidget(backgroundColor: Colors.grey.withOpacity(0.2),onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPageView()));},icon: Iconsax.setting, titleButton: translation(context).setting, colorIcon: Colors.grey, ),
            Divider(height: 0, endIndent: 16.sp, indent: 16.sp,),

            //Version is here
            Text("${translation(context).version} 0.1", style: TextStyle( fontSize: 10.sp), ),

          ],
        ),
      ),
    );
  }
}

