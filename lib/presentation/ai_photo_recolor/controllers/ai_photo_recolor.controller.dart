import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AiPhotoRecolorController extends GetxController {
  File? get image => _image.value;
  int get selectedFilterIndex => _selectedFilterIndex.value;
  Rx<File?> _image = Rx<File?>(null);
  RxInt _selectedFilterIndex = RxInt(0);
  final filters = <String>[
    'Hefe',
    'Sierrra',
    'Valencia',
    'Walden',
    'Xproll',
    'Amaro',
    'Brannan',
    'Earlybird',
  ];

  void setFilterByIndex(int index) {
    _selectedFilterIndex.value = index;
    update();
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
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    }
    _image.refresh();
  }
}
