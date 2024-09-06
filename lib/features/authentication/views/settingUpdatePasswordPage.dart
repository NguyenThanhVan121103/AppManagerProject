import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';

import '../../../common_widgets/widget/button/buttonNumber.dart';
import '../../../common_widgets/widget/container/containerDigiHolder.dart';

class SettingUpdatePasswordPageView extends StatefulWidget {
  const SettingUpdatePasswordPageView({super.key});

  @override
  State<SettingUpdatePasswordPageView> createState() => _SettingUpdatePasswordPageViewState();
}

class _SettingUpdatePasswordPageViewState extends State<SettingUpdatePasswordPageView> {
  late List<bool> selectedIndex, isFilledOut;
  late String code;
  late int isSelected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = [true, false, false, false, false, false];
    isFilledOut = List.filled(selectedIndex.length, false);
    code = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MAppBar(
        backgroundColor: MColor.primary,
        showBackArrows: true,
        iconColor: MColor.third,
      ),
      body: Column(
        children: [
          Expanded(flex: 3,child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text("Enter current password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),)),
          Expanded(flex: 4,
              child: Container(padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                    SizedBox(width: 8,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index){
                        return Row(
                          children: [
                            DigitHolder(onTap: (){_isSelected(index);},
                              isSelected: selectedIndex[index],
                              isFilledOut: isFilledOut[index],),
                            SizedBox(width: 8,),
                          ],
                        );
                      }
                      ,itemCount: 6,),
                    ),
                  ],),
                  SizedBox(height: 100,),
                  Text("Forget password", style: TextStyle(fontSize: 14,color: Colors.blueAccent, fontWeight: FontWeight.bold),),
                ],
              ),)),
          Expanded(flex: 5,child: Container(
            padding:EdgeInsets.all(8),
            color: Colors.grey[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                ButtonNumber(number: "1",onTap: (){_addDigit("1");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "2",onTap: (){_addDigit("2");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "3",onTap: (){_addDigit("3");},),
                ],),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                  ButtonNumber(number: "4",onTap: (){_addDigit("4");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "5",onTap: (){_addDigit("5");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "6",onTap: (){_addDigit("6");},),
                ],),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                  ButtonNumber(number: "7",onTap: (){_addDigit("7");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "8",onTap: (){_addDigit("8");},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "9",onTap: (){_addDigit("9");},),
                ],),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: [
                  ButtonNumber(isSpecialButton: true, icon: Icons.backspace_outlined, onTap: (){_deletedDigit();},),
                  SizedBox(width: 16,),
                  ButtonNumber(number: "0",onTap: (){_addDigit("0");},),
                  SizedBox(width: 16,),
                  ButtonNumber(isSpecialButton: true, icon: Icons.check,),
                ],),
              ],
            ),)),
        ],
      ),
    );
  }
  _isSelected(int index){
    if(index < selectedIndex.length){
      setState(() {
        selectedIndex = List.filled(selectedIndex.length, false);
        selectedIndex[index] = true;
        isSelected = index;
      });
    }
  }

  _addDigit(String itemCode){
    if (isSelected < selectedIndex.length){
      setState(() {
        isFilledOut[isSelected] = true;
      });
        setState(() {
          isSelected += 1;
          code = code + itemCode;
        });
        _isSelected(isSelected);
        print("if 1 +");
    }
    if(isSelected == selectedIndex.length){
      setState(() {
        print("if 2 +");
        code = code + itemCode;
        print("out");
      });
    }
    print("code: $code, isSelected: $isSelected");

  }
  _deletedDigit(){
    print("isSelected $isSelected");
    if(isSelected < selectedIndex.length){
      print("here join");
      if(isSelected == 0){
        print("if 0");
        setState(() {
          isFilledOut[isSelected] = false;
          _isSelected(isSelected);
          code = code.substring(0, isSelected);
          print("This is code: $code" );
        });
      }
      if(isSelected != 0){
        print("if !=");
          setState(() {
            isSelected -= 1;
            isFilledOut[isSelected] = false;
            _isSelected(isSelected);
            code = code.substring(0, isSelected);
            print("This is code: $code" );
          });
      }
    }
    if(isSelected == selectedIndex.length){
      print("join here");
      print("if ==");
      setState(() {
        isFilledOut[isSelected - 1] = false;
        _isSelected(isSelected - 1);
        code = code.substring(0, isSelected);
        print("This is code: $code" );
      });
    }
  }
}


