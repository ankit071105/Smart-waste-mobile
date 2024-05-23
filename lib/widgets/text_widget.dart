import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  late String text;
  late double fontSize;
  late Color? color;
  late String? fontFamily;
  late TextDecoration? decoration;
  final bool? isItalize;
  final bool? isBold;
  final TextAlign align;

  TextWidget(
      {super.key,
      this.decoration,
      this.align = TextAlign.center,
      this.isItalize = false,
      this.isBold = false,
      required this.text,
      required this.fontSize,
      this.color = Colors.black,
      this.fontFamily = 'Regular'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          fontStyle: isItalize! ? FontStyle.italic : null,
          decoration: decoration,
          fontWeight: isBold! ? FontWeight.w800 : FontWeight.normal,
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily),
    );
  }
}
