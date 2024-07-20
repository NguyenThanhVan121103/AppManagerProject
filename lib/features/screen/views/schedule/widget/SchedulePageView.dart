import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/searchBar/searchPageWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/features/screen/views/schedule/widget/detailedInforPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class schedulePageView extends StatefulWidget {
  const schedulePageView({super.key});

  @override
  State<schedulePageView> createState() => _schedulePageViewState();
}

class _schedulePageViewState extends State<schedulePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MAppBar(
          showBackArrows: true,
          colorIcon: MColor.primary,
          backgroundColor: MColor.third,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Schedule", style : TextStyle(fontWeight: FontWeight.bold, color: MColor.primary), ),
              IconButton(icon: Icon(Iconsax.search_normal, color: MColor.primary,), onPressed: (){Get.to(searchPageView());},)
            ],
          ),
        ) ,
        body:GestureDetector(
          onTap: (){Get.to(detailedInfor());},
          child: Container(
            color: MColor.primary,
            child: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MColor.third.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0.sp),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5.sp),
                                    child: Image.asset("assets/images/140x140.png", )),
                              ),
                              SizedBox(
                                width: 231.1.sp,
                                child: Padding(
                                  padding: EdgeInsets.all( 8.0.sp),
                                  child: const Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text("Day: 07/20/2024"),
                                      Text("Time: 3:00 PM - 6:00 PM"),
                                      Text("Driver: Nguyen Van A"),
                                      Text("Type of Vehicle: Large"),
                                      Text("Collection volume: 10 Ton"),
                                      Text("From: QFVQ+QRJ, Phường 5, Vị Thanh, Hậu Giang, Việt Nam", maxLines: 1, overflow: TextOverflow.ellipsis,),
                                      Text("To: Phường 3, Tp. Vị Thanh, Hậu Giang, Việt Nam", overflow: TextOverflow.ellipsis, maxLines: 1,),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 26
            ),
          ),
        )
    );
  }
}

