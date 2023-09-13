import 'package:get/get.dart';

import '../../../../presentation/ai_photo_generator/controllers/ai_photo_generator.controller.dart';

class AiPhotoGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiPhotoGeneratorController>(
      () => AiPhotoGeneratorController(),
    );
  }
}
