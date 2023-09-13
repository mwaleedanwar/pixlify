import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalInfoController extends GetxController {
  File? get image => _image.value;

  TextEditingController get name => _name;
  TextEditingController get number => _number;
  DateTime? get dateOfBirth => _dateOfBirth.value;
  Gender? get gender => _gender.value;
  String? get countryCode => _countryCode.value;
  Rx<File?> _image = Rx<File?>(null);
  final _name = TextEditingController();
  final _number = TextEditingController();
  Rx<String?> _countryCode = Rx<String?>('+1');
  Rx<DateTime?> _dateOfBirth = Rx<DateTime?>(DateTime.now());
  Rx<Gender?> _gender = Rx<Gender?>(null);
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> addImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }

  Future<void> addImageCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  /// update country code observable
  void updateCountryCode(String? code) {
    _countryCode.value = code;
  }

  /// update date of birth observable
  void updateDateOfBirth(DateTime? newDateTime) {
    _dateOfBirth.value = newDateTime;
  }

  void updateGender(Gender newGender) {
    _gender.value = newGender;
  }
}

enum Gender {
  Male,
  Female,
  Other,
}
