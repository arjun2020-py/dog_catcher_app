import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_cather_sizedbox_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_widget/dog_catcher_divder_widget.dart';
import '../../auth/firebase_auth_implemention/fire_auth_services.dart';
import 'compoents/custom_elev_button.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: CustomColor().appTransparntColor,
        title: DogCatcherTextWIdget(
            text: LocalName.dogCatcher.tr,
            color: CustomColor().appBlackColor,
            fontSize: 25,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w700),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 25,
                color: CustomColor().appBlackColor,
              )),
          IconButton(
              onPressed: () {
                _authServices.signOut();
                Get.back();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              color: CustomColor().appTenaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: Alignment.topRight, children: [
                    Image.asset('assets/images/dog .png'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: CustomColor().appGreenColor,
                      ),
                    )
                  ]),
                  Row(
                    children: [
                      DogCatcherTextWIdget(
                          text: 'Homeless Dog',
                          color: CustomColor().appBlackColor,
                          fontSize: 15,
                          fontFamily: CustomFontFamily().PoppinsFamily,
                          fontWeight: FontWeight.w300),
                      horizontalSizedBox(150),
                      Stack(children: [
                        Icon(Icons.location_on_outlined),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 18),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '500',
                                style: TextStyle(
                                    color: CustomColor().appBlackColor)),
                            TextSpan(
                                text: 'm',
                                style: TextStyle(
                                    color: CustomColor().appBlackColor))
                          ])),
                        )
                      ])
                    ],
                  ),
                  DogCatcherTextWIdget(
                      text: 'Male',
                      color: CustomColor().appBlackColor,
                      fontSize: 15,
                      fontFamily: CustomFontFamily().PoppinsFamily,
                      fontWeight: FontWeight.w300),
                  DogCatcherDivderWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomElevButton(
                        icon: Icons.close,
                      ),
                      horizontalSizedBox(20),
                      CustomElevButton(icon: Icons.favorite)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
