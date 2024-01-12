import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'compoents/custom_card_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomColor().appTenaryColor,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
          title: DogCatcherTextWIdget(
              text: LocalName.profile.tr,
              color: CustomColor().appBlackColor,
              fontSize: 25,
              fontFamily: CustomFontFamily().PoppinsFamily,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: CustomColor().appMainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: CustomColor().appWhiteColor,
                  radius: 50,
                  child: Image.asset(
                    CustomImages().profileImage,
                    width: 100,
                  )),
              verticalSizedBox(10),
              DogCatcherTextWIdget(
                  text: 'Jhon smith',
                  color: CustomColor().appBlackColor,
                  fontSize: 20,
                  fontFamily: CustomFontFamily().PoppinsFamily,
                  fontWeight: FontWeight.w700),
              verticalSizedBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customCardWidget(
                    icon: Icons.chat,
                  ),
                  customCardWidget(icon: Icons.email)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DogCatcherTextWIdget(
                      text: LocalName.chat.tr,
                      color: CustomColor().appBlackColor,
                      fontSize: 20,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w300),
                  DogCatcherTextWIdget(
                      text: LocalName.email.tr,
                      color: CustomColor().appBlackColor,
                      fontSize: 20,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w300),
                ],
              ),
              ListTile(
                leading: Card(
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
                title: DogCatcherTextWIdget(
                    text: LocalName.settings,
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: CustomFontFamily().PoppinsFamily,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ));
  }
}
