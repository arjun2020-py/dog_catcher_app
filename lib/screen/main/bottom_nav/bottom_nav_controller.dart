
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/screen_home.dart';
import '../messages/screen_message.dart';
import '../notifcation/screen_notifaction.dart';
import '../profile/screen_profile.dart';
import '../report_dog/screen_report_dog.dart';

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