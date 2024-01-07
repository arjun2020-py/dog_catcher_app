import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController(),
      passwrodController = TextEditingController();
  var isObxText = true;

  buttonClick() {
    if (formKey.currentState!.validate()) {
      usernameController.clear();
      passwrodController.clear();
      Get.toNamed(DogCatcherRoute().home);
    }
  }

  userValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild username';
    }
  }

  passwordValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild password';
    }
  }
}
