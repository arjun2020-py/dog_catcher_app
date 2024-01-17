
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/view/screen_home.dart';
import '../messages/screen_message.dart';
import '../notifcation/screen_notifaction.dart';
import '../profile/view/screen_profile.dart';
import '../report_dog/view/screen_report_dog.dart';

class NavBarController extends GetxController {
  RxInt selectTab = 0.obs;
  RxList<Widget> pages =
      [
    ScreenHome(),
    ScreenNotifaction(),
    ScreenMesaage(),
    ScreenProfile(),
    ScreenReportDog()].obs;

  onChangeTab(int index) {
    selectTab.value = index;
  }
}