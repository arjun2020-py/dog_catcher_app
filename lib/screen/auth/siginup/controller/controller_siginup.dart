import 'package:dog_catcher_app/screen/auth/firebase_auth_implemention/fire_auth_services.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiginupController extends GetxController {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      conformpasswordController = TextEditingController();

  RxBool isAuthenticated = false.obs;

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
    if (value.isEmpty || !RegExp(r'^.{6,32}$').hasMatch(value)) {
      return 'enter atlest 6 characters password';
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

  siginup() async {
    isAuthenticated(true);
    String username = usernameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confromPasswrod = conformpasswordController.text;

    User? user =
        await _authServices.siginupWithEmailAndPassword(email, password);
    isAuthenticated(false);    

    if (user != null) {
      dogCatcherShowToast(message: "User is successfully created");
      Get.back();
    } else {
      dogCatcherShowToast(message: 'some error is occured');
    }
  }
}
