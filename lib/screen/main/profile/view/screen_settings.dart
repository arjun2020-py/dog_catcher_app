import 'package:dog_catcher_app/screen/main/profile/compoents/custom_list_tile_widget.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_divder_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/interlization/interlization.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor().appTenaryColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: DogCatcherTextWIdget(
            text: LocalName.settings.tr,
            color: CustomColor().appBlackColor,
            fontSize: 25,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w600),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DogCatcherDivderWidget(),
          InkWell(
            onTap: () => Get.toNamed(DogCatcherRoute().account),
            child: CustomListTileWidget(
                onPressed: () {
                  Get.toNamed(DogCatcherRoute().account);
                },
                icon: Icons.account_circle,
                text: LocalName.account.tr),
          ),
          DogCatcherDivderWidget(),
          CustomListTileWidget(
              onPressed: () {},
              icon: Icons.security,
              text: LocalName.privacySecurity.tr),
          DogCatcherDivderWidget(),
          CustomListTileWidget(
              onPressed: () {},
              icon: Icons.workspaces,
              text: LocalName.about.tr),
          DogCatcherDivderWidget()
        ],
      ),
    );
  }
}
