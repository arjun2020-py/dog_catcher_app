import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controller/controller_report_dog.dart';
import '../model/model_report_dog.dart';

class CustomRadio extends StatelessWidget {
 // Gender _gender;

  CustomRadio(this.reportDogController, this.index);

  final ReportDogController reportDogController;
  int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => 
      Card(
          color: reportDogController.gender[index].isSelected
              ? Color(0xFF3B4257)
              : Colors.white,
          child: Container(
            height: 50,
            width: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  reportDogController.gender[index].icon,
                  color:  reportDogController.gender[index].isSelected ? Colors.white : Colors.grey,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                   reportDogController.gender[index].name,
                  style: TextStyle(
                      color: reportDogController.gender[index].isSelected ? Colors.white : Colors.grey),
                )
              ],
            ),
          )),
    );
  }
}
