import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:get/get.dart';

import '../../firebase_auth_implemention/auth_status_enum.dart';
import '../../firebase_auth_implemention/fire_auth_services.dart';

class ControllerSplash extends GetxController {
  var isSplashLoading = true.obs;
  final FirebaseAuthServices _authServices = FirebaseAuthServices();

  //intially
  AuthStatus _authStatus = AuthStatus.notSignedIn;

  Future<void> splash() async {
    Future.delayed(
      Duration(seconds: 5),
      () {
        switch (_authStatus) {
          case AuthStatus.notSignedIn:
            Get.toNamed(DogCatcherRoute().login);

            break;
          case AuthStatus.signedIn:
            Get.toNamed(DogCatcherRoute().bottomNav);
            break;
          default:
        }
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    _authServices.currentUser().then((userId) {
      _authStatus =
          userId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
    });

    splash();
  }
}
