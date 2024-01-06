import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../interlization/interlization.dart';

class DogCatcherTextWIdget extends StatelessWidget {
  const DogCatcherTextWIdget({
    super.key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontFamily,
    required this.fontWeight
  });
  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: fontSize,fontFamily: fontFamily,fontWeight: fontWeight),);
  }
}
