import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AiBatchEnhanceController extends GetxController {
  List<File> get images => _images.value;
  int get currentIndex => _currentIndex.value;
  Rx<List<File>> _images = Rx<List<File>>([]);
  RxInt _currentIndex = 0.obs;
  Future<void> addImagesGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    for (var pickedFile in pickedFiles) {
      _images.value.add(File(pickedFile.path));
    }
    _images.refresh();
  }

  void removeImage(int index) {
    _images.value.removeAt(index);
    update();
  }

  void updateCurrentImageIndex(int index) {
    _currentIndex.value = index;
    update();
  }
}
