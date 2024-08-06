import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final int? fontSize;
  final bool? isUnderLine;
  final Color? color;

  const TextWidget(
      {Key? key, this.text, this.fontSize, this.isUnderLine = false, this.color = const Color(
          0xFF363f93)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 3, // space between underline and text
      ),
      decoration: BoxDecoration(
        border: isUnderLine! ? Border(bottom: BorderSide(
          color: Theme
              .of(context)
              .primaryColor, // Text colour here
          width: 1.0, // Underline width
        ),):null,
      ),

      child: Text(text!, style: TextStyle(
        fontSize: fontSize?.toDouble(), fontFamily: "Avenir",
        fontWeight: FontWeight.w900,
        color: Theme
            .of(context)
            .primaryColor,

      ),),
    );
  }
}
