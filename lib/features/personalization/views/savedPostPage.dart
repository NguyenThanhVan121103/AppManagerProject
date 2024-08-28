import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/database/news_DB/new_data.dart';
import 'package:appmanager/database/notification_DB/notification_DB.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';

enum SampleItem {itemOne, itemTwo}

class SavedPostPageView extends StatefulWidget {
  const SavedPostPageView({super.key});

  @override
  State<SavedPostPageView> createState() => _SavedPostPageViewState();
}

class _SavedPostPageViewState extends State<SavedPostPageView> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary, showBackArrows: true, iconColor: Colors.white,
        title: Text("Saved Post", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemBuilder: (BuildContext context, int index){
              return Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageContainerWidget(imgURl: "assets/images/1000x500.png", width: 120, height: 60, borderRadius: 0,),
                    Expanded(
                      child: Wrap(
                        children: [
                          Text(notificationData[index].title, overflow: TextOverflow.ellipsis, maxLines: 1, style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                          Text(notificationData[index].suptitle, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 10),)
                        ],
                      ),
                    ),
                    // IconButton(onPressed: (){_showDialog();}, icon: Icon(Icons.more_vert)),
                    PopupMenuButton<SampleItem>(
                      initialValue: selectedItem,
                        onSelected: (SampleItem item){
                        setState(() {
                          selectedItem = item;
                        });
                        },
                        itemBuilder: (BuildContext context)=> <PopupMenuEntry<SampleItem>>[
                          const PopupMenuItem<SampleItem>(child:Text("Open post"), value: SampleItem.itemOne,),
                          const PopupMenuItem<SampleItem>(child:Text("Delete save"), value: SampleItem.itemTwo,),
                        ]
                    ),
                  ],
                ),
              );
            },
            itemCount: notificationData.length, separatorBuilder: (BuildContext context, int index) { return Divider(height: 0,); },
          )
        ],
      ),
    );
  }
  Future<void> _showDialog(){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Container(
          height: MediaQuery.of(context).size.height*0.15,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonNormal(titleButton: "Open post", onPressed: (){Navigator.pop(context);},),
              SizedBox(height: 16,),
              ButtonNormal(titleButton: "Delete save", onPressed: (){Navigator.pop(context);},)
            ],
          ),
        ),
      );

    });
}
}
