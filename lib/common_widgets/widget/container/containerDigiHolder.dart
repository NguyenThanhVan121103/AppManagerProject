import 'package:flutter/material.dart';

class DigitHolder extends StatelessWidget {
  const DigitHolder({
    super.key,
    this.onTap,
    required this.isSelected,
    required this.isFilledOut,
  });
  final void Function()? onTap;
  final bool isSelected, isFilledOut;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.blue : Colors.black),
          color: Colors.white,
        ),
        child: isFilledOut ? Container(width: 15, height: 15,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black),) : Container(),
      ),
    );
  }
}
