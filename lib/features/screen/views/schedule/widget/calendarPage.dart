import 'package:appmanager/features/screen/views/schedule/widget/addTaskPage.dart';
import 'package:appmanager/features/screen/views/schedule/widget/taskDetailPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/heading/headingCalendarWidget.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

import '../../../../../common_widgets/widget/container/cotainerTasks.dart';
import '../../../../../database/colectionCalender_DB/colectionCalendar_data.dart';

class CalendarPageView extends StatefulWidget {
  const CalendarPageView({super.key});

  @override
  State<CalendarPageView> createState() => _CalendarPageViewState();
}

class _CalendarPageViewState extends State<CalendarPageView> {
  DateTime today = DateTime.now();
  bool isPressed = true;
  DateTime _selectedDate = DateTime.now();
  late List<int> containerStatus = taskData.map((e) => 0).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(
        backgroundColor: MColor.primary,
        iconColor: Colors.white,
        showBackArrows: true,
        title: Text(
          "Schedule",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: <Widget>[
            // Heading (Date Time Now)
            SliverToBoxAdapter(
              child: HeadingCalendarWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTask()),
                  );
                },
              ),
            ),

            // Calendar
            SliverToBoxAdapter(
              child: DatePicker(
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: MColor.primary,
                selectedTextColor: Colors.white,
                monthTextStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
                dateTextStyle: const TextStyle(
                  fontSize: 20,
                ),
                dayTextStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Task
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (taskData[index].date == DateFormat.yMd().format(_selectedDate)) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TaskDetailPageView(index: index,date: _selectedDate, )),
                        );
                      },
                      onLongPressStart: (_) {
                        _showBottomSheet(context, index);
                      },
                      child: ContainerTasks(
                        index: index,
                        taskStatus: containerStatus[index],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: taskData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, int index) {
    Get.bottomSheet(
      Container(
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                height: 4,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ButtonNormal(
                      titleButton: (containerStatus[index] != 2) ? "Task Completed" : "To Do Task",
                      onPressed: () {
                        setState(() {
                          containerStatus[index] = (containerStatus[index] != 2) ? 2 : 0;
                          Navigator.pop(context);
                        });
                      },
                      colorButton: MColor.primary,
                      heightButton: 42.sp,
                    ),
                    SizedBox(height: 8.sp),
                    ButtonNormal(
                      titleButton: (containerStatus[index] != 1) ? "Doing Task" : "To Do",
                      onPressed: () {
                        setState(() {
                          containerStatus[index] = (containerStatus[index] != 1) ? 1 : 0;
                          Navigator.pop(context);
                        });
                      },
                      colorButton: MColor.primary,
                      heightButton: 42.sp,
                    ),
                    SizedBox(height: 16.sp),
                    ButtonNormal(
                      titleButton: "Deleted Task",
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Do you want to delete this task?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes"),
                              ),
                            ],
                          ),
                        );
                      },
                      colorButton: MColor.second,
                      heightButton: 42.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
