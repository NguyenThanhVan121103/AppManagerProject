import 'package:appmanager/common_widgets/widget/container/cotainerTasks.dart';
import 'package:appmanager/features/screen/views/contract/widget/addContractPage.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';
import 'package:spwidget/common_widgets/widget/text/textIcon.dart';

import '../../../../../constants/constColor.dart';

class ContractPageView extends StatefulWidget {
  const ContractPageView({super.key});

  @override
  State<ContractPageView> createState() => _ContractPageViewState();
}

class _ContractPageViewState extends State<ContractPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        title: const Text("Add Contract", style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white
        ),),
        backgroundColor: MColor.primary,
        showBackArrows: true,
        iconColor: MColor.third,
        action: [
          IconButton(onPressed: (){}, icon: Icon(Icons.person), color: Colors.white,)
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [

            //Title + button
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Title", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                  ButtonNormal(
                    titleButton: "Add Contract", onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddContractPageView()));
                  },
                  heightButton: 56,

                  )
                ],
              ),
            ),

            // Contract List
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContractPageView()));

                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0
                            ),
                            color: MColor.primary,
                          ),
                          child: const Row(
                            children: [
                              ImageContainerWidget(imgURl: "assets/images/500x500.png", width: 150,height: 150, borderRadius: 0,),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextIcon(icon: Iconsax.calendar,text: ": 8/2/2024", color: Colors.white,),
                                    TextIcon(text: "Số: 156-786/HDTX", fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                                    TextIcon(text: "Bên thuê: Công ty một thành viên Nguyen Thanh Van", maxline: 2,overflow: TextOverflow.ellipsis, color: Colors.white,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: 4
              ),

            )
          ],
        ),
      ),
    );
  }
}
