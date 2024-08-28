import 'package:appmanager/common_widgets/widget/textfield/textFieldInput.dart';
import 'package:flutter/material.dart';

class TextFieldSimple extends StatelessWidget {
  const TextFieldSimple({
    super.key,
    required this.title,
    this.iconButton,
    this.notReadOnly = true, this.onPressed, this.controller,
  });
  final String title;
  final IconData? iconButton;
  final bool notReadOnly;
  final void Function()? onPressed;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(
              fontSize: 15,
              color: Colors.grey
          ),),
          TextFieldInput(showContainer: false, notReadOnly: notReadOnly,controller: controller,)
        ],
      ),
    );
  }
}
