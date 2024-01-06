import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class DogCatcherTextfiledWidget extends StatelessWidget {
  const DogCatcherTextfiledWidget({super.key, required this.hintText});
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: CustomColor().appSecondryColor,
            border: OutlineInputBorder()),
      ),
    );
  }
}
