
import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controller1 =TextEditingController();
  TextEditingController controller2 =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
      ),
      body: Column(
        children: [
          TextFieldInput(title: 'data1', controller: controller1,),
          TextFieldInput(title: 'data2', controller: controller2,),
          SizedBox(height: 32,),
          ButtonNormal(titleButton: "Add", onPressed: (){
            Map<String, String> saveData = {
              'data1': controller1.text,
              'data2': controller2.text,
            };

            FirebaseFirestore
                .instance
                .collection('DataDemo')
                .doc(DateTime.now().toString())
                .set(saveData).then((_) => {
                  print('Documetn  with Id added successfully')
            }).catchError((error){
              print("Failed to add documtn: $error");
            });
            },),
          SizedBox(height: 32,),
          ButtonNormal(titleButton: "Delete", onPressed: (){
            FirebaseFirestore
                .instance
                .collection('DataDemo')
                .doc(DateFormat.yMd().format(DateTime.now()))
                .delete();
          },),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("DataDemo").snapshots(),
              builder: (context, snapshot){
                List<Row> clientWidgets = [];
                if(snapshot.hasData) {
                  final clients = snapshot.data?.docs.reversed.toList();
                  for(var client in clients!){
                    final clientWidget = Row(
                      children: [
                        Text(client['data1']),
                        Text(client['data2']),
                      ],
                    );
                    clientWidgets.add(clientWidget);
                  }
                }
                return Expanded(child: ListView(children: clientWidgets,));
              })

        ],
      ),

    );
  }
}
