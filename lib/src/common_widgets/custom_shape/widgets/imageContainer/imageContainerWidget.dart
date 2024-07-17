import 'package:flutter/material.dart';

class imageContainerWidget extends StatelessWidget {
  const imageContainerWidget({
    super.key,
    this.isNetworkImage = false,
    required this.imgURl,
    this.padding = 8.0,
    this.borderRadius = 30,
    this.height = 180,
    this.width = 350,
    this.ontap,

  });

  final bool isNetworkImage;
  final String imgURl;
  final double padding;
  final double borderRadius;
  final double height, width;
  final void Function()? ontap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
            image: isNetworkImage ? NetworkImage(imgURl) : AssetImage(imgURl) as ImageProvider,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}




