import 'package:appmanager/common_widgets/widget/container/cotainerTasks.dart';
import 'package:appmanager/database/contract_DB/imgContract_data.dart';
import 'package:appmanager/features/screen/views/contract/widget/addContractPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: MasonryGridView.builder(
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Image.asset(imgContractData[index].srcImg),
                          Text(imgContractData[index].codeContract)
                        ],
                      ),
                    ),
                  ),
                  itemCount: imgContractData.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
