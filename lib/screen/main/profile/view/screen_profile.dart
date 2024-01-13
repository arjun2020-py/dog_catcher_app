import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_divder_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../compoents/custom_card_widget.dart';
import '../compoents/custom_list_tile_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: CustomColor().appTenaryColor,
          // leading: IconButton(
          //     onPressed: () {
          //     },
          //     icon: Icon(Icons.arrow_back_ios_new)),
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
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      backgroundColor: CustomColor().appWhiteColor,
                      radius: 50,
                      child: Image.asset(
                        CustomImages().profileImage,
                        width: 100,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: CustomColor().appBlackColor,
                        )),
                  ),
                ],
              ),
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
              verticalSizedBox(50),
              DogCatcherDivderWidget(),
              InkWell(
                onTap: () {
                  Get.toNamed(DogCatcherRoute().settings);
                },
                child: CustomListTileWidget(
                    onPressed: () => Get.toNamed(DogCatcherRoute().settings),
                    icon: Icons.settings,
                    text: LocalName.settings.tr),
              ),
              DogCatcherDivderWidget(),
              CustomListTileWidget(
                  onPressed: () {}, icon: Icons.help, text: LocalName.qA.tr),
              DogCatcherDivderWidget(),
              CustomListTileWidget(
                  onPressed: () {},
                  icon: Icons.mobile_friendly,
                  text: LocalName.referFriends.tr),
              DogCatcherDivderWidget()
            ],
          ),
        ));
  }
}
