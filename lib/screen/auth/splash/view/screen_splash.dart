import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_widget/dog_catcher_image_widget.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../controller/controller_splash.dart';

class ScreenSplash extends StatelessWidget {
  ScreenSplash({super.key});
  final controllerSplash = Get.put(ControllerSplash());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DogCatcherImageWidget(
                imageUrl: CustomImages().appLogImage, width: 200),
            DogCatcherTextWIdget(
              text: LocalName.dogCatcher.tr,
              color: CustomColor().appLogoHeadingColor,
              fontSize: 25,
              fontFamily: CustomFontFamily().PoppinsFamily,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
