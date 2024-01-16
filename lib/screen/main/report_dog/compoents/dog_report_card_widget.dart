import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:flutter/material.dart';

import '../../../../utils/custom_widget/dog_cather_textfiled_widget.dart';
import '../controller/controller_report_dog.dart';

class DogReportCardWidget extends StatelessWidget {
  const DogReportCardWidget(
      {super.key,
      required this.reportDogController,
      required this.icon,
      required this.hintText,
      required this.controller,
      required this.validator});

  final ReportDogController reportDogController;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;
   final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
          color: CustomColor().appWhiteColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Icon(
            icon,
            size: 40,
          ),
        ),
        Expanded(
          child: DogCatcherTextfiledWidget(
              radius: 20,
              hintText: hintText,
              validator: validator,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              obxText: false,
              controller: controller),
        )
      ],
    );
  }
}
