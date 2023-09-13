import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixlify/components/images/images.dart';

class AiAvatarGeneratorController extends GetxController {
  List<File> get selectedImages => _selectedImages.value;
  RxList<File> _selectedImages = <File>[].obs;

  final goodImageExamples = <String>[
    Images.goodImage1,
    Images.goodImage2,
    Images.goodImage3,
    Images.goodImage4,
  ];
  final badImageExamples = <String>[
    Images.badImage1,
    Images.badImage2,
    Images.badImage3,
    Images.badImage4,
  ];

  final generatedImagesExamples = <String>[
    Images.avatarExample1,
    Images.avatarExample2,
    Images.avatarExample3,
    Images.avatarExample4,
    Images.avatarExample5,
    Images.avatarExample6,
    Images.avatarExample7,
    Images.avatarExample8,
  ];

  void pickImages() async {
    final images = await ImagePicker().pickMultiImage();
    for (int imageIndex = 0;
        imageIndex < min(10, images.length);
        imageIndex++) {
      _selectedImages.add(
        File(images[imageIndex].path),
      );
    }
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    _selectedImages.refresh();
  }
}
