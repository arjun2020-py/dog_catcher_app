import 'package:flutter/material.dart';

import '../custom_color/custom_color.dart';

class DogCatcherDivderWidget extends StatelessWidget {
  const DogCatcherDivderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: CustomColor().appDivderColor,
    );
  }
}