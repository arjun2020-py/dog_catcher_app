import 'package:dog_catcher_app/screen/auth/siginup/controller/controller_siginup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_images/custom_images.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/custom_widget/dog_catcher_toast.dart';
import '../../../../utils/custom_widget/dog_cather_sizedbox_widget.dart';
import '../../../../utils/custom_widget/dog_cather_textfiled_widget.dart';
import '../../../../utils/interlization/interlization.dart';

class ScreenAccount extends StatelessWidget {
  ScreenAccount({super.key});
  final siginupController = Get.put(SiginupController());
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
              text: LocalName.account.tr,
              color: CustomColor().appBlackColor,
              fontSize: 25,
              fontFamily: CustomFontFamily().PoppinsFamily,
              fontWeight: FontWeight.w600),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          verticalSizedBox(100),
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
          verticalSizedBox(50),
          DogCatcherTextfiledWidget(
            controller: siginupController.usernameController,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            obxText: false,
            validator: (value) => siginupController.userValidation(value!),
            hintText: LocalName.username.tr,
          ),
          DogCatcherTextfiledWidget(
              controller: siginupController.emailController,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.emailAddress,
              obxText: false,
              validator: (value) => siginupController.mobileValidation(value!),
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
                  backgroundColor:
                      MaterialStateProperty.all(CustomColor().appTenaryColor),
                  minimumSize: MaterialStateProperty.all(
                    const Size(double.infinity, 50),
                  )),
              onPressed: () {
                if (siginupController.formKey.currentState!.validate()) {
                  siginupController.siginup();
                  dogCatcherShowToast(message: "User is successfully created");
                }
              },
              child: Obx(
                () => siginupController.isAuthenticated.value
                    ? CircularProgressIndicator()
                    : DogCatcherTextWIdget(
                        text: LocalName.edit.tr,
                        color: CustomColor().appLogoHeadingColor,
                        fontSize: 15,
                        fontFamily: CustomFontFamily().PoppinsFamily,
                        fontWeight: FontWeight.w400),
              )),
        ]));
  }
}
