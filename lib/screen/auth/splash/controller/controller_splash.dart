import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:get/get.dart';

import '../../firebase_auth_implemention/fire_auth_services.dart';

class ControllerSplash extends GetxController {
  var isSplashLoading = true.obs;
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  Future<void> splash() async {
    Future.delayed(
      Duration(seconds: 5),
      () {
        Get.toNamed(DogCatcherRoute().login);
      },
    );
  }

  

  @override
  void onInit() {
    
    super.onInit();
    splash();
  
  }
}
