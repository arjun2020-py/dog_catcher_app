import 'package:flutter/material.dart';

import '../../../../utils/custom_font_family/custom_font_family.dart';
import '../../../../utils/custom_widget/dog_catcher_text_widget.dart';

class CustomListTileWidget extends StatelessWidget {
  const CustomListTileWidget(
      {super.key, required this.icon, required this.text,required this.onPressed});
  final IconData icon;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
        child: Icon(
          icon,
          color: Colors.black,
          size: 35,
        ),
      ),
      title: Center(
        child: DogCatcherTextWIdget(
            text: text,
            color: Colors.black,
            fontSize: 20,
            fontFamily: CustomFontFamily().PoppinsFamily,
            fontWeight: FontWeight.w300),
      ),
      trailing: IconButton(
          onPressed: onPressed, icon: Icon(Icons.arrow_forward_ios_sharp)),
    );
  }
}
