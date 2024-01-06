import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:get/get.dart';

class ControllerSplash extends GetxController {
  var isSplashLoading = true.obs;

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
    splash();
    super.onInit();
  }
}
