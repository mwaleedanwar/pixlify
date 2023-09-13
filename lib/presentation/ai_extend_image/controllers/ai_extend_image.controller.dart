import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AiExtendImageController extends GetxController {
  File? get image => _image.value;
  TextEditingController get aspectWidth => _aspectWidth;
  TextEditingController get aspectHeight => _aspectHeight;
  Rx<File?> _image = Rx<File?>(null);
  final _aspectWidth = TextEditingController();
  final _aspectHeight = TextEditingController();

  Future<void> addImageCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }

  Future<void> addImageGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }
}
