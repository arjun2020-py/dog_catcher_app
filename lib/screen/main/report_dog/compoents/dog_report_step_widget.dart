import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';

class DogReportStepWidget extends StatelessWidget {
  const DogReportStepWidget({
    super.key,
    required this.step
  });
  final String step;
  @override
  Widget build(BuildContext context) {
    return DogCatcherTextWIdget(
        text: step,
        color: CustomColor().appBlackColor,
        fontSize: 18,
        fontFamily: CustomFontFamily().PoppinsFamily,
        fontWeight: FontWeight.w300);
  }
}
