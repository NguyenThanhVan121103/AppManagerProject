import 'package:flutter/cupertino.dart';

class newsMenuModel{
  String title;
  IconData icons;
  void Function()? onTap;

  newsMenuModel({
    required this.onTap,
    required this.icons,
    required this.title
});
}