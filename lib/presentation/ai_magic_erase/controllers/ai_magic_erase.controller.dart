import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AiMagicEraseController extends GetxController {
  File? get image => _image.value;
  Rx<File?> _image = Rx<File?>(null);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

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
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }
}
