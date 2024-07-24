import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class buttonAddTaskWidget extends StatelessWidget {
  const buttonAddTaskWidget({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onPressed;},
      child: Container(height: 60.sp, width: 160.sp,
          decoration: BoxDecoration(
              // color: Color(0xff145eee),
              color: MColor.primary,

              borderRadius: BorderRadius.circular(15)
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(left: 20.sp, child: Icon(Iconsax.add, color: Colors.white,)),
              Positioned(right: 30.sp, child: Text("Add Task", style: TextStyle(fontSize: 20.sp, color: Colors.white),))
            ],
          )
      ),
    );
  }
}

