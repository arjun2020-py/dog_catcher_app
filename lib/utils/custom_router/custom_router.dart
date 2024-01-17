import 'package:dog_catcher_app/screen/auth/login/view/screen_login.dart';
import 'package:dog_catcher_app/screen/auth/siginup/view/screen_siginup.dart';
import 'package:dog_catcher_app/screen/main/messages/screen_chat_message.dart';
import 'package:dog_catcher_app/screen/main/profile/view/screen_account.dart';
import 'package:dog_catcher_app/screen/main/profile/view/screen_settings.dart';
import 'package:flutter/material.dart';

import '../../screen/main/bottom_nav/bottom_nav.dart';
import '../../screen/main/home/view/screen_home.dart';

class DogCatcherRoute {
  String login = 'login';
  String siginup = 'signup';
  String home = 'home';
  String bottomNav = 'bottom_nav';
  String chatRoom = 'screen_chat';
  String settings = 'settings';
  String account = 'account';
}

Map<String, Widget Function(BuildContext)> dogCatcherMainRouter =
    <String, WidgetBuilder>{
  DogCatcherRoute().login: (context) => ScreenLogin(),
  DogCatcherRoute().siginup: (context) => ScreenSignup(),
  DogCatcherRoute().home: (context) => ScreenHome(),
  DogCatcherRoute().bottomNav: (context) => BottomNavBarScreen(),
  DogCatcherRoute().chatRoom: (context) => ScreenChat(),
  DogCatcherRoute().settings: (context) => ScreenSettings(),
  DogCatcherRoute().account :(context) => ScreenAccount()
};
