import 'package:dog_catcher_app/utils/custom_color/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void dogCatcherShowToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CustomColor().appMainColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
