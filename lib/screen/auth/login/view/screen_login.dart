import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_image_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_or_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_widget/dog_cather_textfiled_widget.dart';
import '../controller/controller_login.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor().appMainColor,
        body: SafeArea(
          child: Center(
            child: Form(
              key: loginController.formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      verticalSizedBox(100),
                      DogCatcherTextWIdget(
                          text: LocalName.login.tr,
                          color: CustomColor().appLogoHeadingColor,
                          fontSize: 25,
                          fontFamily: CustomFontFamily().PoppinsFamily,
                          fontWeight: FontWeight.w700),
                      DogCatcherImageWidget(
                          imageUrl: CustomImages().loginLogImage, width: 200),
                      DogCatcherTextfiledWidget(
                        controller: loginController.emailController,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        obxText: false,
                        validator: (value) =>
                            loginController.userValidation(value!),
                        hintText: LocalName.email.tr,
                      ),
                      DogCatcherTextfiledWidget(
                          controller: loginController.passwrodController,
                          obxText: true,
                          textInputType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) =>
                              loginController.passwordValidation(value!),
                          hintText: LocalName.password.tr),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  CustomColor().appTenaryColor),
                              minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 50),
                              )),
                          onPressed: () {
                            if (loginController.formKey.currentState!
                                .validate()) {
                              loginController.siginIn();
                            }
                          },
                          child: Obx(
                            () => loginController.isAuthenticated.value
                                ? CircularProgressIndicator()
                                : DogCatcherTextWIdget(
                                    text: LocalName.login.tr,
                                    color: CustomColor().appLogoHeadingColor,
                                    fontSize: 15,
                                    fontFamily:
                                        CustomFontFamily().PoppinsFamily,
                                    fontWeight: FontWeight.w400),
                          )),
                      verticalSizedBox(15),
                      CustomOrWidget(),
                      verticalSizedBox(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                              onTap: () {
                                loginController.siginInWithGoogle();
                              },
                              child: FaIcon(FontAwesomeIcons.google)),
                          FaIcon(FontAwesomeIcons.github),
                          FaIcon(FontAwesomeIcons.linkedin)
                        ],
                      ),
                      verticalSizedBox(50),
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
                            onTap: () {
                              Get.toNamed(DogCatcherRoute().siginup);
                            },
                            child: loginController.isAuthenticated.value
                                ? CircularProgressIndicator()
                                : DogCatcherTextWIdget(
                                    text: LocalName.siginup.tr,
                                    color: CustomColor().appLogoHeadingColor,
                                    fontSize: 15,
                                    fontFamily:
                                        CustomFontFamily().PoppinsFamily,
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
