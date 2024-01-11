import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:flutter/material.dart';

class CustomElevButton extends StatelessWidget {
  const CustomElevButton({
    super.key,
    required this.icon
  });
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Icon(
        icon,
        color: CustomColor().appWhiteColor,
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(40)))),
          backgroundColor:
              MaterialStateProperty.all(CustomColor().buttonGreenColor)),
    );
  }
}
