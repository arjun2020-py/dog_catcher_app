import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/model_report_dog.dart';

class ReportDogController extends GetxController {
  final dogNameController = TextEditingController(),
      dogLocationController = TextEditingController(),
      addNoteController = TextEditingController();

  RxList<Gender> gender = <Gender>[
    Gender('Male', Icons.male, false),
    Gender('Female', Icons.female, false)
  ].obs;

  RxString imagePath = RxString('');
  
  radioButtonSlection(int index) {
    gender.value.forEach((gender) => gender.isSelected = false);
    gender[index].isSelected = true;
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }
}
