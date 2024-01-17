import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/model_report_dog.dart';

class ReportDogController extends GetxController {
  final dogNameController = TextEditingController(),
      dogLocationController = TextEditingController(),
      addNoteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxList<Gender> gender = <Gender>[
    Gender('Male', Icons.male, false),
    Gender('Female', Icons.female, false)
  ].obs;
  var genderName = ''.obs;

  String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

  String imageUrl = '';

  CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('report_dog_list');
  var isLodaing = false.obs;

  radioButtonSlection(int index) {
    gender.value.forEach((gender) => gender.isSelected = false);
    gender[index].isSelected = true;
    genderName.value = gender[index].name;
    print(genderName);
  }

  Future<void> pickImageFromGallery() async {
    //step1: pick image
    //1.1): install image picker
    //1.2): import corresponding library

    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    print('path === ${file?.path}');

    if (file == null) return;

    //step2: upload to firebase storage.
    //2.1): install firebase_storage
    //2.2): import corresponding library

    // Get the reference to storage root
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');

    //create a reference for the image to be stored
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

    //Handle errors/success
    try {
      //store the file.
      await referenceImageToUpload.putFile(File(file!.path));
      //success: get the download URL.
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      //add some error code
    }
  }

  dogNameValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild dogname';
    }
  }

  dogLocationValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild dog location';
    }
  }

  addNoteValidation(String value) {
    if (value.isEmpty) {
      return 'enter vaild note about dog';
    }
  }

  publishReport() async {

    if (formKey.currentState!.validate()) {
          isLodaing(true);

      String dogName = dogNameController.text;
      String dogLocation = dogLocationController.text;
      String addNote = addNoteController.text;
      if (imageUrl.isEmpty) {
        Get.showSnackbar(GetSnackBar(message: 'Please upload an image'));
      }
      //create a map of data
      Map<String, String> dataToSend = {
        
        'name': dogName,
        'location': dogLocation,
        'add_note': addNote,
        'gender': genderName.value,
        'image': imageUrl,
      };

      //add new item to  the report_dog_list collection in firebase
    await  _collectionReference.add(dataToSend);
      isLodaing(false);
    }
  }
}
