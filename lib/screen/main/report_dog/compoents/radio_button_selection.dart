import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/interlization/interlization.dart';
import 'Custom_radio.dart';
import '../controller/controller_report_dog.dart';

class RadioButtonSelectionWidget extends StatefulWidget {
  const RadioButtonSelectionWidget({
    super.key,
    required this.reportDogController,
  });

  final ReportDogController reportDogController;

  @override
  State<RadioButtonSelectionWidget> createState() =>
      _RadioButtonSelectionWidgetState();
}

class _RadioButtonSelectionWidgetState
    extends State<RadioButtonSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => Row(
          children: [
            ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: widget.reportDogController.gender.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.pinkAccent,
                    onTap: () {
                      setState(() {
                        widget.reportDogController.radioButtonSlection(index);
                      });
                    },
                    child: CustomRadio(widget.reportDogController, index),
                  );
                }),
            DogCatcherTextWIdget(
                text: LocalName.gender.tr,
                color: CustomColor().appBlackColor,
                fontSize: 18,
                fontFamily: CustomFontFamily().PoppinsFamily,
                fontWeight: FontWeight.w300)
          ],
        ),
      ),
    );
  }
}
