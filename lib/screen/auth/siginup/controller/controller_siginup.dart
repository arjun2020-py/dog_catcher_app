import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiginupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController(),
      mobileController = TextEditingController(),
      passwordController = TextEditingController(),
      conformpasswordController = TextEditingController();

  buttonClick() {
    if (formKey.currentState!.validate()) {
      usernameController.clear();
      mobileController.clear();
      passwordController.clear();
      conformpasswordController.clear();
      Get.back();
    }
  }

  userValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild username';
    }
  }

  mobileValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild mobile no';
    }
  }

  passwordValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild password';
    }
  }

  conformPasswordValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild password again';
    } else if (passwordController.text != conformpasswordController.text) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }
}
