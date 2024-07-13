import 'package:appmanager/src/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../constants/constColor.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hello, Good day!!!",
            style: TextStyle(
              fontSize: 15,
              color: MColor.third,
            ),
          ),
          Text(
            'Nguyen Thanh Van',
            style: TextStyle(
              fontSize: 20,
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
            onPressed: (){})
      ],
    );
  }
}

