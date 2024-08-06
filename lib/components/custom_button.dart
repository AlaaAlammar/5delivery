import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height, width;
  final double? fontSize;
  final String buttonName;
  final Color? buttonColor, fontColor;
  final Function() onTap;

   CustomButton(
      {required this.height,
      required this.width,
      required this.buttonName,
        required this.onTap,
      this.buttonColor,
      this.fontSize,
      this.fontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor ?? Colors.white,
            borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color:fontColor ?? Colors.white,
              fontSize: fontSize ?? 20 ,

            ),
          ),
        ),
      ),
    );
  }
}
