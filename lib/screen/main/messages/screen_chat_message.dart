import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenChat extends StatelessWidget {
  const ScreenChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      appBar: AppBar(
        backgroundColor: CustomColor().appTenaryColor,
        leading: IconButton(
            onPressed: () {
              Get.toNamed(DogCatcherRoute().bottomNav);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: DogCatcherTextWIdget(
            text: LocalName.localAnimalControlServices.tr,
            color: CustomColor().appBlackColor,
            fontSize: 18,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w600),
      ),
      floatingActionButton: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.1,
        child: Card(
          color: CustomColor().appTenaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              FloatingActionButton(
                backgroundColor: CustomColor().appGreenColor,
                onPressed: () {
                  // Handle chat button press
                },
                child: Icon(Icons.send_and_archive_rounded),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
