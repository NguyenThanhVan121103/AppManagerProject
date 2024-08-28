import 'package:appmanager/database/news_DB/new_data.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';

import '../../../../../common_widgets/widget/listview/listviewNewsShort.dart';
enum SampleItem {itemOne, itemTwo}

class newsDemoPageView extends StatefulWidget {
  const newsDemoPageView({super.key});

  @override
  State<newsDemoPageView> createState() => _newsDemoPageViewState();
}

class _newsDemoPageViewState extends State<newsDemoPageView> {
  SampleItem? selectedItem;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        showBackArrows: true,
        backgroundColor: MColor.primary,
        iconColor: Colors.white,
        title: const Text("Năm 2024, điểm chuẩn ngành Sư phạm ngữ văn và"
            " Sư phạm lịch sử của Trường Đại học Sư phạm Hà Nội là 29,3,"
            " áp dụng với tổ hợp khối C00 (văn, sử, địa).", style: TextStyle(fontSize: 20, color: Colors.white),),
        action: [
          PopupMenuButton<SampleItem>(
            iconColor: Colors.white,
              initialValue: selectedItem,
              onSelected: (SampleItem item){
                setState(() {
                  selectedItem = item;
                });
              },
              itemBuilder: (BuildContext context)=> <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(child:Text("Saved Post"), value: SampleItem.itemOne,),
                const PopupMenuItem<SampleItem>(child:Text("Share Post"), value: SampleItem.itemTwo,),
              ]
          ),
        ],
    ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Padding(padding: EdgeInsets.all(8), child:Column(children: [
              Text(newsData[0].titles,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(height: 14,),
              Row(children: [
                ImageContainerWidget(imgURl: "assets/images/maleAvatar.jpg", height: 30,width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Van Nguyen",),
                    Text("Tuesday, 20/08/2024 - 12:40")
                  ],
                ),
              ],),
              SizedBox(height: 14,),
              Text("Năm 2024, điểm chuẩn ngành Sư phạm ngữ văn và Sư phạm lịch sử của Trường Đại học Sư phạm Hà Nội là 29,3, áp dụng với tổ hợp khối C00 (văn, sử, địa).",
              style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),
              Text("Như vậy, để trúng tuyển vào hai ngành này, thí sinh cần đạt xấp xỉ 9,77 điểm/môn. ",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),
              Text("Điều này có nghĩa, thí sinh 29 điểm cũng trượt nguyện vọng. Thí sinh 28 điểm không có cơ hội. Còn thí sinh 27 điểm, tức 9 điểm/môn hoàn toàn không nên đăng ký.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),
              Column(
                children: [
                  ImageContainerWidget(imgURl: newsData[0].imgUrls),
                  Text("Họp báo, cung cấp thông tin kết quả kỳ thi tuyển sinh vào lớp 10", style: TextStyle(fontFamily: "Roboto",fontStyle: FontStyle.italic, fontSize: 12 ),),
                ],
              ),
              SizedBox(height: 14,),
              Text(
                "Một năm trước, ngành Sư phạm lịch sử của trường này lấy 28,42 với khối C00, mức điểm gây chấn động vào mùa tuyển sinh 2023.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),
              Text("Ngành Quan hệ công chúng của Trường Đại học Khoa học xã hội và Nhân văn - Đại học Quốc gia Hà Nội - giữ vị trí số 2 về điểm chuẩn khối C00 năm nay với 29,1 điểm, tương đương 9,7 điểm/môn. ",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),
              Text("Ngành Tâm lý học của Đại học Y Hà Nội trong năm đầu tuyển sinh cũng lấy điểm chuẩn rất cao ở khối C00 với 28,83, tương đương 9,61 điểm/môn. Đây cũng là mức điểm chuẩn cao nhất trường Y.",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 14,),

              Text("RELATED NEWS", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),),


              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  ImageContainerWidget(imgURl: newsData[0].imgUrls, height: 80,width: 160, borderRadius: 0,),
                  Flexible(child: Text(newsData[0].titles, maxLines: 3, overflow: TextOverflow.ellipsis,)),
                ],),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  ImageContainerWidget(imgURl: newsData[1].imgUrls, height: 80,width: 160, borderRadius: 0,),
                  Flexible(child: Text(newsData[1].titles, maxLines: 3, overflow: TextOverflow.ellipsis,)),
                ],),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(children: [
                  ImageContainerWidget(imgURl: newsData[2].imgUrls, height: 80,width: 160, borderRadius: 0,),
                  Flexible(child: Text(newsData[2].titles, maxLines: 3, overflow: TextOverflow.ellipsis,)),
                ],),
              ),

            ],)
              ,),
          ],
          )
          )
        ],
      )
    );
  }
}
