import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class DogCatcherTextfiledWidget extends StatelessWidget {
   DogCatcherTextfiledWidget(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.textInputAction,
      required this.textInputType,
      required this.obxText,
      required this.controller,
      this.radius
      });
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final bool obxText;
  final TextEditingController controller;
  double? radius;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        //textAlign: TextAlign.center,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        obscureText: obxText,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: CustomColor().appSecondryColor,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0))),
      ),
    );
  }
}
