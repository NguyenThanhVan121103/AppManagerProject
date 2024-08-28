import 'dart:io';

import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:appmanager/controller/contract/contractController.dart';
import 'package:intl/intl.dart';
import 'package:spwidget/common_widgets/widget/appbar/appBarWidget.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/text/textIcon.dart';

class AddContractPageView extends StatefulWidget {
  const AddContractPageView({super.key});

  @override
  State<AddContractPageView> createState() => _AddContractPageViewState();
}

class _AddContractPageViewState extends State<AddContractPageView> {

  late bool isButtonActive = false;

  // Selected Time
  late int isDateTime = 0;

  String _selectedDateTime = DateFormat.yMd().format(DateTime.now());
  String _selectedLDateTime = DateFormat.yMd().format(DateTime.now());
  String _selectedRDateTime = DateFormat.yMd().format(DateTime.now());


  //File Image
  List<XFile>?  imageFileList = [];
  final ImagePicker _picker = ImagePicker();

  @override
  void initState(){
    contractContrller.codeContractController.addListener(() {_isButtonActive();});
    contractContrller.dateSignedController.addListener(() {_isButtonActive();});
    contractContrller.nameLessorController.addListener(() {_isButtonActive();});
    contractContrller.idCardLController.addListener(() {_isButtonActive();});
    contractContrller.addressProvidedLController.addListener(() {_isButtonActive();});
    contractContrller.dateRangeLController.addListener(() {_isButtonActive();});
    contractContrller.nameRenterController.addListener(() {_isButtonActive();});
    contractContrller.idCardRController.addListener(() {_isButtonActive();});
    contractContrller.dateRangeRController.addListener(() {_isButtonActive();});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: MAppBar(
        title: TextIcon(text: "Add Contract", fontWeight: FontWeight.bold, color: MColor.third,),
        action: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.person, color: Colors.white,))
        ],
        showBackArrows: true,
        iconColor: Colors.white,
        backgroundColor: MColor.primary,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text Field
              TextFieldInput(title: "Signed on", hintText: _selectedDateTime, iconButton: Iconsax.calendar, onPressed: (){
                _getDateFromUser(isDateTime = 0);
              }, controller:  contractContrller.dateSignedController = TextEditingController(text: _selectedDateTime),),
              TextFieldInput(title: "Contract Code", hintText: "Enter code here", controller: contractContrller.codeContractController,),

              const SizedBox(height: 20,),
              const Divider(thickness: 2,),
              const SizedBox(height: 20,),

              //Text field of Lessor
              const Text("Lessor", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              TextFieldInput(title: "Name", hintText: "Enter name here",controller:  contractContrller.nameLessorController,),
              TextFieldInput(title: "Citizen Identification Card", hintText: "Enter code here", controller:  contractContrller.idCardLController,),
              TextFieldInput(title: "Provided By", hintText: "Enter adress here",controller:  contractContrller.addressProvidedLController,),
              TextFieldInput(title: "Date Range", hintText: _selectedLDateTime, onPressed: (){
                _getDateFromUser(isDateTime = 1);
              },iconButton: Iconsax.calendar,controller: contractContrller.dateRangeLController = TextEditingController(text: _selectedLDateTime),),

              const SizedBox(height: 20,),
              const Divider(thickness: 2,),
              const SizedBox(height: 20,),


              // Text field of Renter
              Text("Renter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              TextFieldInput(title: "Name", hintText: "Enter name here", controller:  contractContrller.nameRenterController,),
              TextFieldInput(title: "Citizen Identification Card", hintText: "Enter code here", controller:  contractContrller.idCardRController,),
              TextFieldInput(title: "Provided By", hintText: "Enter adress here",controller:  contractContrller.addressProvidedRController,),
              TextFieldInput(title: "Date Range", hintText: _selectedRDateTime, onPressed: (){
                _getDateFromUser(isDateTime = 2);
              },iconButton: Iconsax.calendar, controller: contractContrller.dateRangeRController = TextEditingController(text: _selectedRDateTime),),
              const SizedBox(height: 20,),


              // Upload Multiple Image
              // IconButton(onPressed: _pickImages, icon: Icon(Iconsax.camera)),
              Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width*0.8,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageFileList?.length,
                          itemBuilder: (BuildContext context, index){
                            return GestureDetector(
                                onTap: (){
                                  print(imageFileList);
                                },
                                child: Stack(
                                  children: [
                                    Image.file(
                                      File(imageFileList![index].path),
                                      width: 100,
                                      height: 100,
                                    ),
                                    Positioned(bottom: 65,left: 64,child:IconButton(icon: Icon(Icons.dangerous_outlined, color: Colors.grey,), onPressed: (){
                                      setState(() {
                                        imageFileList!.removeAt(index);
                                      });
                                      print(imageFileList);
                                    },)),
                                  ],
                                )
                            );
                          }
                      ),
                    ),
                    IconButton(onPressed: myAlert, icon: Icon(Iconsax.camera))]),
              SizedBox(height: 8,),
              ButtonNormal(titleButton: "Save Contract", colorTitle: isButtonActive ? Colors.white : Colors.black, colorButton: isButtonActive ? MColor.primary : MColor.third,)
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser(int isDateTime) async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if(_pickerDate != null ) {
      if(isDateTime == 0){
        setState(() {
          _selectedDateTime = DateFormat.yMd().format(_pickerDate);
        });
      } if (isDateTime == 1){
        _selectedLDateTime = DateFormat.yMd().format(_pickerDate);
      }else {
        _selectedRDateTime = DateFormat.yMd().format(_pickerDate);
      }
    }
    else{
      print("Something is wrong!!!!");
    }
  }

  _pickImagesGallery() async{
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    setState(() {
      imageFileList!.addAll(selectedImages);
      Navigator.pop(context);
    });
  }

  _pickImagesCamera() async{
    final XFile? imageSource = await _picker.pickImage(source: ImageSource.camera);
    XFile image = XFile(imageSource!.path);
    setState(() {
      imageFileList!.add(image);
      Navigator.pop(context);
    });
  }

  myAlert(){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Text("Please select image source", style: TextStyle(fontWeight: FontWeight.bold),),
        content: Container(
          height: MediaQuery.of(context).size.height*0.20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonNormal(titleButton: "Camera", onPressed: _pickImagesCamera,),
              SizedBox(height: 16,),
              ButtonNormal(titleButton: "Library", onPressed: _pickImagesGallery,)
            ],
          ),
        ),
      );
        }
    );
  }
  _isButtonActive(){
    if(
    contractContrller.dateSignedController.text.isNotEmpty == true &&
        contractContrller.codeContractController.text.isNotEmpty == true &&
        contractContrller.nameLessorController.text.isNotEmpty == true &&
        contractContrller.idCardLController.text.isNotEmpty == true &&
        contractContrller.addressProvidedLController.text.isNotEmpty == true &&
        contractContrller.dateRangeLController.text.isNotEmpty == true &&
        contractContrller.nameRenterController.text.isNotEmpty == true &&
        contractContrller.idCardRController.text.isNotEmpty == true &&
        contractContrller.addressProvidedRController.text.isNotEmpty == true &&
        contractContrller.dateRangeRController.text.isNotEmpty == true
    ) {
      setState(() {
        isButtonActive = true;
      });
    }else{
      setState(() {
        isButtonActive = false;
      });
    }
  }


}
