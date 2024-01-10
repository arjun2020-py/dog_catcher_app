import 'package:dog_catcher_app/screen/auth/siginup/controller/controller_siginup.dart';
import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../firebase_auth_implemention/fire_auth_services.dart';

class LoginController extends GetxController {
  final FirebaseAuthServices _authServices = FirebaseAuthServices();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(),
      passwrodController = TextEditingController();
  RxBool isAuthenticated = false.obs;

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
    isAuthenticated(true);
    String email = emailController.text;
    String password = passwrodController.text;

    User? user = await _authServices.siginWithEmailAndPassword(email, password);
    isAuthenticated(false);
    if (user != null) {
      dogCatcherShowToast(message: "User is successfully siginIn");
      Get.toNamed(DogCatcherRoute().bottomNav);
    } else {
      dogCatcherShowToast(message: 'some error is occured');
    }
  }

  siginInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        //note: google account siginin with firebase account.

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        await _firebaseAuth.signInWithCredential(credential);
        Get.toNamed(DogCatcherRoute().home);
      }
    } catch (e) {
      print('error is${e}');
      dogCatcherShowToast(message: "some error occured $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
