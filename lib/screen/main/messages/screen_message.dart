import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_images/custom_images.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenMesaage extends StatelessWidget {
  const ScreenMesaage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor().appMainColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(CustomImages().messageLoginImage),
              verticalSizedBox(20),
              DogCatcherTextWIdget(
                  text: LocalName.welcomeToChatty.tr,
                  color: CustomColor().appBlackColor,
                  fontSize: 20,
                  fontFamily: CustomFontFamily().PoppinsFamily,
                  fontWeight: FontWeight.w600),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 20),
                child: DogCatcherTextWIdget(
                    text: LocalName.chatWithLocalAnimalControlServices.tr,
                    color: CustomColor().appBlackColor,
                    fontSize: 16,
                    fontFamily: CustomFontFamily().PoppinsFamily,
                    fontWeight: FontWeight.w300),
              ),
              verticalSizedBox(50),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(DogCatcherRoute().chatRoom);
                },
                child: DogCatcherTextWIdget(
                  text: LocalName.startChat.tr,
                  color: CustomColor().appBlackColor,
                  fontSize: 20,
                  fontFamily: CustomFontFamily().PoppinsFamily,
                  fontWeight: FontWeight.w400,
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width * 0.7, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        CustomColor().appSecondryColor)),
              )
            ],
          ),
        ));
  }
}
