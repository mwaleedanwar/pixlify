import 'package:get/get.dart';

import '../../../../presentation/ai_photo_recolor/controllers/ai_photo_recolor.controller.dart';

class AiPhotoRecolorControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiPhotoRecolorController>(
      () => AiPhotoRecolorController(),
    );
  }
}
