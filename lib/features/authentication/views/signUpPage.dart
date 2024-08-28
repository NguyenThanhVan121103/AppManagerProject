import 'package:appmanager/common_widgets/widget/navigationbar/navigationMenu.dart';
import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/features/authentication/views/signInPage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spwidget/common_widgets/widget/button/buttonBorder.dart';
import 'package:spwidget/common_widgets/widget/image/ImageContainerWidget.dart';


import '../../../common_widgets/widget/button/buttonImage.dart';
import '../../../common_widgets/widget/heading/headingSingnIn.dart';

final _formKey = GlobalKey<FormState>();

class SignUpPageView extends StatefulWidget {
  const SignUpPageView({
    super.key});

  @override
  State<SignUpPageView> createState() => _SignUpPageViewState();
}

class _SignUpPageViewState extends State<SignUpPageView> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = false;
  late bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          HeadingSingnIn(
            child: Container(
              alignment: Alignment.center,
              child: Text("Get Started Now", style: TextStyle(
                  fontSize: 45.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldInput(
                    controller: _nameController,
                    hintText: "Name",
                    validator: (name) => name != null
                        ? "Please enter Email or Phone Number"
                        : null,
                    heightContainer: 52.h,
                  ),
                  TextFieldInput(
                    controller: _nameController,
                    hintText: "Email or phone number",
                    validator: (name) => name != null
                        ? "Please enter Email or Phone Number"
                        : null,
                    heightContainer: 52.h,
                  ),
                  TextFieldInput(controller: _passwordController,hintText: "Password",
                    validator: (password) => password != null
                        ? "Please enter password"
                        : null,
                    heightContainer: 52.h,
                    obscureText:isShowPassword ?  false : true,
                    iconButton:isShowPassword ?  Iconsax.eye : Iconsax.eye_slash,
                    notReadOnly: false,
                    onPressed: _showPassword,
                  ),
                  Row(
                    children: [
                      Checkbox(value: isChecked, onChanged: (bool? value){
                        setState(() {
                          isChecked = value!;
                        });
                      }, checkColor: Colors.white,),
                      Text.rich(
                        TextSpan(
                          text: 'I agree to the ',
                          children: [
                            TextSpan(
                              text: "tems & policy", style: TextStyle(color: Colors.blue),
                              recognizer: TapGestureRecognizer()..onTap = (){_showDialog(context);}
                            ),

                          ]
                        )
                      )
                    ],
                  ),

                  SizedBox(height: 16.h,),
                  ButtonNormal(
                    titleButton: "Sign Up",
                    onPressed: (){
                      Get.off(navigationMenu());
                      // _formKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    children: [
                      Expanded(child: Divider(height: 0,)),
                      Text("Or"),
                      Expanded(child: Divider(height: 0,))
                    ],
                  ),

                  SizedBox(height: 16.sp,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonImage(srcImg: "assets/logo/logoGoogle.png", title: 'Sign-in with Google',),
                      SizedBox(width: 16.w,),
                      ButtonImage(srcImg: "assets/logo/logoApple.png", title: 'Sign-in with Google',),
                    ],
                  ),
                  SizedBox(height: 16.h,),
                  Text.rich(
                    TextSpan(
                      text: "Have an account! ",
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()..onTap =(){Get.off(SignInPageView());},
                          style: TextStyle(
                            color: Colors.blue,
                          )
                        )
                      ]
                    )
                  )
                ],
              ),
            ),
          )


        ],
      ),
    );
  }
  Future<void> _showDialog(BuildContext context){
    return showDialog<void>(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: const Text("Terms and Conditions"),
        content: SizedBox(
          height: MediaQuery.of(context).size.height*0.58,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    "1. Acceptance of Terms: By creating an account, you agree to be bound by these terms and conditions. If you do not agree, you must not use our app.",
                  style: TextStyle(
                    fontSize: 14.sp
                  ),
                ),
                Text(
                    "2. User Responsibilities: You are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.",
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                ),
                Text(
                    "3. Prohibited Activities: You may not use our app for illegal activities, spamming, or any activity that violates the rights of others.",
            
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                ),
                Text(
                    "4. Termination: We reserve the right to suspend or terminate your account if you violate these terms.",
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                ),
                Text(
                    "5. Changes to Terms: We may update these terms at any time. Continued use of the app after changes are made will constitute your acceptance of the new terms.",
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                ),
                Text(
                    "6. Governing Law: These terms are governed by the laws of [Your Country/State].",
                  style: TextStyle(
                      fontSize: 14.sp
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Disagree")),
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Agree")),
      ],
      );
        });
  }
  _showPassword(){
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }
}


