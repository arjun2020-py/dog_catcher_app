import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:dog_catcher_app/utils/custom_font_family/custom_font_family.dart';
import 'package:dog_catcher_app/utils/custom_widget/dog_catcher_text_widget.dart';
import 'package:dog_catcher_app/utils/interlization/interlization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenNotifaction extends StatelessWidget {
  const ScreenNotifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor().appMainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor().appTenaryColor,
        leading:
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
        title: DogCatcherTextWIdget(
            text: LocalName.notification.tr,
            color: CustomColor().appBlackColor,
            fontSize: 25,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w700),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.circle_notifications_sharp,
                size: 25,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: CustomColor().appSecondryColor,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/profile.png',
                ),
              ),
              title: Text('Jhon smith'),
              subtitle: Text('stray dog at your \nlocation'),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle_outline_rounded,
                    color: CustomColor().appGreenColor,
                  )),
            ),
          );
        },
      ),
    );
  }
}
