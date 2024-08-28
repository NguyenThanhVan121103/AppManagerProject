import 'package:appmanager/common_widgets/widget/navigationbar/navigationMenu.dart';
import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:appmanager/features/authentication/views/signUpPage.dart';
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

class SignInPageView extends StatefulWidget {
  const SignInPageView({
    super.key});

  @override
  State<SignInPageView> createState() => _SignInPageViewState();
}

class _SignInPageViewState extends State<SignInPageView> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  late bool isShowPassword = false;

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          HeadingSingnIn(
            child: Container(
              alignment: Alignment.center,
              child: const Text("Welcome back!", style: TextStyle(
                  fontSize: 45,
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
                    hintText: "Email or phone number",
                    validator: (name) => name != null
                        ? "Please enter Email or Phone Number"
                        : null,
                  ),
                  TextFieldInput(controller: _passwordController,hintText: "Password",
                    validator: (password) => password != null
                        ? "Please enter password"
                        : null,
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
                      Text("Remember for 30 days")
                    ],
                  ),

                  SizedBox(height: 16.sp,),
                  ButtonNormal(
                    titleButton: "Sign In",
                    onPressed: (){
                      Get.off(navigationMenu());
                      // _formKey.currentState!.validate();
                    },
                  ),
                  SizedBox(height: 16.sp,),
                  const Row(
                    children: [
                      Expanded(child: Divider(height: 0,)),
                      Text("Or"),
                      Expanded(child: Divider(height: 0,))
                    ],
                  ),
                  SizedBox(height: 64.sp,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonImage(srcImg: "assets/logo/logoGoogle.png", title: 'Sign-in with Google',),
                      SizedBox(width: 16,),
                      ButtonImage(srcImg: "assets/logo/logoApple.png", title: 'Sign-in with Google',),
                    ],
                  ),
                  SizedBox(height: 16.sp,),
                  Text.rich(
                      TextSpan(
                          text: "Don't have an account! ",
                          children: [
                            TextSpan(
                                text: 'Sign Up',
                                recognizer: TapGestureRecognizer()..onTap =(){
                                  Get.off(SignUpPageView());
                                },
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
  _showPassword(){
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }
}


