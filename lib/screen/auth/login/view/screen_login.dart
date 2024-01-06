import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_image_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_or_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_widget/dog_cather_textfiled_widget.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor().appMainColor,
        body: SafeArea(
          child: Center(
            child: Column(
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
                  hintText: LocalName.username.tr,
                ),
                DogCatcherTextfiledWidget(hintText: LocalName.password.tr),
                verticalSizedBox(15),
                CustomOrWidget(),
                verticalSizedBox(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FaIcon(FontAwesomeIcons.google),
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
                    DogCatcherTextWIdget(
                        text: LocalName.siginup.tr,
                        color: CustomColor().appLogoHeadingColor,
                        fontSize: 15,
                        fontFamily: CustomFontFamily().PoppinsFamily,
                        fontWeight: FontWeight.w700),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
