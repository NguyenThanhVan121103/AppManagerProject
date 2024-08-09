import 'dart:io';

import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/constants/constColor.dart';
import 'package:appmanager/controller/contract/contractController.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
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
  String _selectedDateTime = DateFormat.yMd().format(DateTime.now());

  //File Image
  List<XFile>?  imageFileList;
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
                _getDateFromUser();
              },),
              const TextFieldInput(title: "Contract Code", hintText: "Enter code here"),

              const SizedBox(height: 20,),
              const Divider(thickness: 2,),
              const SizedBox(height: 20,),

              //Text field of Lessor
              const Text("Lessor", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const TextFieldInput(title: "Name", hintText: "Enter name here",),
              const TextFieldInput(title: "Citizen Identification Card", hintText: "Enter code here",),
              const TextFieldInput(title: "Provided By", hintText: "Enter adress here",),
              const TextFieldInput(title: "Date Range", hintText: "Enter date here",),

              const SizedBox(height: 20,),
              const Divider(thickness: 2,),
              const SizedBox(height: 20,),


              // Text field of Renter
              const Text("Renter", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const TextFieldInput(title: "Name", hintText: "Enter name here",),
              const TextFieldInput(title: "Citizen Identification Card", hintText: "Enter code here",),
              const TextFieldInput(title: "Provided By", hintText: "Enter adress here",),
              const TextFieldInput(title: "Date Range", hintText: "Enter date here",),
              const SizedBox(height: 20,),


              // Upload Multiple Image
              // IconButton(onPressed: _pickImages, icon: Icon(Iconsax.camera)),
              ButtonNormal(titleButton: "Upload Image", onPressed: myAlert,
              ),
              SizedBox(height: 8,),
              imageFileList != null ? GestureDetector(
                onTap: (){
                  print(imageFileList);
                },
                child: Wrap(
                  children: imageFileList!.map((image){
                    return Image.file(
                      File(image.path),
                      width: 100,
                      height: 100,
                    );
                  }).toList(),
                ),
              ) :
              imageFileList != null ?
              GestureDetector(
                onTap: (){
                  print(imageFileList);
                },
                child: Wrap(
                  children: imageFileList!.map((image){
                    return Image.file(
                      File(image!.path),
                      width: 100,
                      height: 100,
                    );
                  }).toList(),
                ),
              )

                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser() async{
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));
    if(_pickerDate != null) {
      setState(() {
        _selectedDateTime = DateFormat.yMd().format(_pickerDate);
      });
    }
    else{
      print("Something is wrong!!!!");
    }
  }

  _pickImagesGallery() async{
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    setState(() {
      imageFileList = selectedImages;
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
        isButtonActive = false;
      });
    }else{
      setState(() {
        isButtonActive = true;
      });
    }
  }
}
