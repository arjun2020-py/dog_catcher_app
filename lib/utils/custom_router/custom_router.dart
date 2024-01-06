import 'package:dog_catcher_app/screen/auth/login/view/screen_login.dart';
import 'package:dog_catcher_app/screen/auth/siginup/view/screen_siginup.dart';
import 'package:flutter/material.dart';

class DogCatcherRoute {
  String login = 'login';
  String siginup = 'signup';
  String home = 'home';
}

Map<String, Widget Function(BuildContext)> dogCatcherMainRouter =
    <String, WidgetBuilder>{
  DogCatcherRoute().login: (context) => ScreenLogin(),
  DogCatcherRoute().siginup: (context) => ScreenSignup(),
 // DogCatcherRoute().home: (context) => HomeScreen(),
};