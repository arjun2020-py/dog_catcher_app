import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirebaseAuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> siginupWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      //email duplication
      if (e.code == 'email-already-in-use') {
        dogCatcherShowToast(message: 'This email address is already in use.');
      } else {
        dogCatcherShowToast(message: 'An error occured: ${e.code}');
      }
    }
  }

  Future<User?> siginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return credential.user;
    } on FirebaseAuthException catch (e) {
      //email is created or not
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        dogCatcherShowToast(message: 'Invaild email or password.');
      } else {
        dogCatcherShowToast(message: 'An error occured: ${e.code}');
      }
    }
  }

  Future<String> currentUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  // Sign out
  Future signOut() async {
    await auth.signOut();
    Get.toNamed(DogCatcherRoute().login);
  }
}
