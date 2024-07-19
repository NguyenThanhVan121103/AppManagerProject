import 'package:appmanager/common_widgets/custom_shape/widgets/imageContainer/imageContainerWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'customHeadingWidget.dart';

class accountHeadingWidget extends StatelessWidget {
  const accountHeadingWidget({
    super.key,
    this.onPressed,
    required this.imgURL,
    required this.nameUser,
    required this.numberPhone,
  });

  final Widget? onPressed;
  final String imgURL, nameUser, numberPhone;

  @override
  Widget build(BuildContext context) {
    return customHeadingContainer(
      heightHeading: 250,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(onPressed);
            },
            child: Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                ),
                child:Stack(
                  alignment: Alignment.center,
                  children: [
                    //Avatar
                    Positioned(top: 60,child: Container(
                        decoration: BoxDecoration(
                            color: MColor.third,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: imageContainerWidget(imgURl: imgURL, height: 40, width: 40,borderRadius: 100,))),

                    // User Name
                    Positioned(top:130,child: Text(nameUser, style:  TextStyle(color: MColor.third, fontSize: 25, fontWeight: FontWeight.bold),)),

                    //Number Phone
                    Positioned(top:160 ,child: Row(children: [Icon(Icons.star, color: Colors.amber,), Text(numberPhone, style: TextStyle(color: MColor.third),)],)),

                    //Icon Edit
                    Positioned(top:190 ,child: Icon(Iconsax.edit,size: 30, color: MColor.third,),),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}



