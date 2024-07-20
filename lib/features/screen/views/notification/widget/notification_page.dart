import 'package:appmanager/common_widgets/custom_shape/widgets/notification/notificationListview.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:appmanager/common_widgets/custom_shape/widgets/appBar/appBarWidget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notificationPageView extends StatefulWidget {
  const notificationPageView({super.key});

  @override
  State<notificationPageView> createState() => _notificationPageViewState();
}

class _notificationPageViewState extends State<notificationPageView> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicator = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MAppBar(
        padding: EdgeInsets.only(bottom: 16.sp),
        backgroundColor: MColor.third,
        title: const Center(
          child: Text(
            'Notification',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      // List notification
      body: Container(
        color: MColor.primary,
        child: RefreshIndicator(
          key: _refreshIndicator,
            onRefresh: () async{
              return Future<void>.delayed(const Duration(seconds: 2));
            },
            child: const notificationListWidget(index: 16, colorListView: MColor.third,)),
      ),
    );;
  }
}

