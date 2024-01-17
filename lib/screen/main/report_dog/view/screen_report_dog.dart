import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_divder_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_textfiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_router/custom_router.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/interlization/interlization.dart';
import '../compoents/Custom_radio.dart';
import '../compoents/dog_report_card_widget.dart';
import '../compoents/dog_report_step_widget.dart';
import '../controller/controller_report_dog.dart';
import '../model/model_report_dog.dart';
import '../compoents/radio_button_selection.dart';

class ScreenReportDog extends StatelessWidget {
  ScreenReportDog({super.key, this.gender});
  Gender? gender;

  final reportDogController = Get.put(ReportDogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor().appMainColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: CustomColor().appTenaryColor,
          title: DogCatcherTextWIdget(
              text: LocalName.reportDog.tr,
              color: CustomColor().appBlackColor,
              fontSize: 25,
              fontFamily: CustomFontFamily().PoppinsFamily,
              fontWeight: FontWeight.w600),
        ),
        body: Form(
          key: reportDogController.formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DogReportStepWidget(step: LocalName.step1.tr),
                DogReportCardWidget(
                  controller: reportDogController.dogNameController,
                  validator: (value) =>
                      reportDogController.dogNameValidation(value!),
                  reportDogController: reportDogController,
                  icon: Icons.drag_indicator,
                  hintText: LocalName.dogName.tr,
                ),
                DogCatcherDivderWidget(),
                DogReportCardWidget(
                    controller: reportDogController.dogLocationController,
                    validator: (value) =>
                        reportDogController.dogLocationValidation(value!),
                    reportDogController: reportDogController,
                    icon: Icons.location_on,
                    hintText: LocalName.dogLocation.tr),
                DogCatcherDivderWidget(),
                DogReportCardWidget(
                    controller: reportDogController.addNoteController,
                    validator: (value) =>
                        reportDogController.addNoteValidation(value!),
                    reportDogController: reportDogController,
                    icon: Icons.chat_bubble,
                    hintText: LocalName.addNote.tr),
                DogCatcherDivderWidget(),
                DogReportStepWidget(step: LocalName.step2.tr),
                DogCatcherDivderWidget(),
                RadioButtonSelectionWidget(
                    reportDogController: reportDogController),
                DogCatcherDivderWidget(),
                DogReportStepWidget(step: LocalName.step3.tr),
                DogCatcherDivderWidget(),
                Row(
                  children: [
                    Card(
                      color: CustomColor().appWhiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Icon(
                        Icons.monochrome_photos,
                        size: 40,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          reportDogController.pickImageFromGallery();
                        },
                        child: DogCatcherTextWIdget(
                            text: LocalName.addPicture.tr,
                            color: CustomColor().appBlackColor,
                            fontSize: 20,
                            fontFamily: CustomFontFamily().PoppinsFamily,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                DogCatcherDivderWidget(),
                Center(
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        reportDogController.publishReport();
                      },
                      child: reportDogController.isLodaing.value
                          ? CircularProgressIndicator()
                          : DogCatcherTextWIdget(
                              text: LocalName.publish.tr,
                              color: CustomColor().appBlackColor,
                              fontSize: 20,
                              fontFamily: CustomFontFamily().PoppinsFamily,
                              fontWeight: FontWeight.w400,
                            ),
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.7, 50)),
                          backgroundColor: MaterialStateProperty.all(
                              CustomColor().appSecondryColor)),
                    ),
                  ),
                ),
                verticalSizedBox(10)
              ],
            ),
          ),
        ));
  }
}
