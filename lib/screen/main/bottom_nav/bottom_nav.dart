import 'package:dog_catcher_app/utils/custom_router/custom_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color/custom_color.dart';
import '../../../utils/interlization/interlization.dart';
import 'bottom_nav_controller.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});
  final navController = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: navController.pages[navController.selectTab.value],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: navController.selectTab.value,
              onTap: (index) => navController.onChangeTab(index),
              selectedItemColor: CustomColor().appBlackColor,
              unselectedItemColor: CustomColor().appGaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items:  [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: LocalName.home.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: LocalName.notification.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), label: LocalName.message.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: LocalName.profile.tr),
                       BottomNavigationBarItem(
                    icon: Icon(Icons.add_circle_outline_rounded), label: LocalName.reportDog.tr),

              ])),
    );
  }
}
