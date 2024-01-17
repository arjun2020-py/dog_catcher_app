import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/custom_color/custom_color.dart';
import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';
import '../../../../utils/interlization/interlization.dart';

class CustomListTileWidget extends StatelessWidget {
   CustomListTileWidget({
    super.key,
    required this.icons,
    required this.title,
    required this.subTitle,
    this.tralingIconColor
  });
 final IconData icons;
 final String title;
 final String subTitle;
  Color? tralingIconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icons),
      title: DogCatcherTextWIdget(
          text: title,
          color: CustomColor().appBlackColor,
          fontSize: 15,
          fontFamily: CustomFontFamily().PoppinsFamily,
          fontWeight: FontWeight.w200),
      subtitle: DogCatcherTextWIdget(
          text: subTitle,
          color: CustomColor().appBlackColor,
          fontSize: 15,
          fontFamily: CustomFontFamily().PoppinsFamily,
          fontWeight: FontWeight.w400),
      trailing: IconButton(
          onPressed: () {}, icon: Icon(Icons.arrow_forward_ios,color:tralingIconColor ,)),
    );
  }
}