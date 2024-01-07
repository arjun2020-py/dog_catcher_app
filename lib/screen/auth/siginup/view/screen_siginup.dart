import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_images/custom_images.dart';
import '../../../../utils/custom_widget/dog_catcher_image_widget.dart';
import '../../../../utils/custom_widget/dog_catcher_or_widget.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/custom_widget/dog_cather_sizedbox_widget.dart';
import '../../../../utils/custom_widget/dog_cather_textfiled_widget.dart';
import '../../../../utils/interlization/interlization.dart';
import '../controller/controller_siginup.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  final siginupController = Get.put(SiginupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      body: Center(
        child: ListView(
          children: [
            Form(
              key: siginupController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  verticalSizedBox(100),
                  DogCatcherTextWIdget(
                      text: LocalName.siginup.tr,
                      color: CustomColor().appLogoHeadingColor,
                      fontSize: 25,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w700),
                  DogCatcherImageWidget(
                      imageUrl: CustomImages().siginupLogImage, width: 200),
                  DogCatcherTextfiledWidget(
                    controller: siginupController.usernameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    obxText: false,
                    validator: (value) =>
                        siginupController.userValidation(value!),
                    hintText: LocalName.username.tr,
                  ),
                  DogCatcherTextfiledWidget(
                      controller: siginupController.emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      obxText: false,
                      validator: (value) =>
                          siginupController.mobileValidation(value!),
                      hintText: LocalName.email.tr),
                  DogCatcherTextfiledWidget(
                      controller: siginupController.passwordController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obxText: true,
                      validator: (value) =>
                          siginupController.passwordValidation(value!),
                      hintText: LocalName.password.tr),
                  DogCatcherTextfiledWidget(
                      controller: siginupController.conformpasswordController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.text,
                      obxText: true,
                      validator: (value) =>
                          siginupController.conformPasswordValidation(value!),
                      hintText: LocalName.conformPassword.tr),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              CustomColor().appTenaryColor),
                          minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          )),
                      onPressed: () {
                        if (siginupController.formKey.currentState!
                            .validate()) {
                          siginupController.siginup();
                        }
                      },
                      child: DogCatcherTextWIdget(
                          text: LocalName.siginup.tr,
                          color: CustomColor().appLogoHeadingColor,
                          fontSize: 15,
                          fontFamily: CustomFontFamily().PoppinsFamily,
                          fontWeight: FontWeight.w400)),
                  verticalSizedBox(15),
                  CustomOrWidget(),
                  verticalSizedBox(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DogCatcherTextWIdget(
                          text: LocalName.donHaveanAccount.tr,
                          color: CustomColor().appLogoHeadingColor,
                          fontSize: 15,
                          fontFamily: CustomFontFamily().PoppinsFamily,
                          fontWeight: FontWeight.w300),
                      horizontalSizedBox(20),
                      InkWell(
                        onTap: () => Get.back(),
                        child: DogCatcherTextWIdget(
                            text: LocalName.login.tr,
                            color: CustomColor().appLogoHeadingColor,
                            fontSize: 15,
                            fontFamily: CustomFontFamily().PoppinsFamily,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  verticalSizedBox(10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
