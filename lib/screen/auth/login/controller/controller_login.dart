import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../firebase_auth_implemention/fire_auth_services.dart';

class LoginController extends GetxController {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(),
      passwrodController = TextEditingController();
  var isObxText = true;

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

  siginIn() async {
    String email = emailController.text;
    String password = passwrodController.text;

    User? user = await _authServices.siginWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully siginIn");
      Get.toNamed(DogCatcherRoute().home);
    } else {
      print('some error is occured');
    }
  }
}
