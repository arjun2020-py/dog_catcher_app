import 'package:flutter/material.dart';

import '../../../../utils/custom_color/custom_color.dart';

class customCardWidget extends StatelessWidget {
  const customCardWidget({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 68,
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          color: CustomColor().appSecondryColor,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 35,
              ))),
    );
  }
}
