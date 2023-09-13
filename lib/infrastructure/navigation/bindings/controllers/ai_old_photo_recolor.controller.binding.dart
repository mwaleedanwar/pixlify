import 'package:get/get.dart';

import '../../../../presentation/ai_old_photo_recolor/controllers/ai_old_photo_recolor.controller.dart';

class AiOldPhotoRecolorControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiOldPhotoRecolorController>(
      () => AiOldPhotoRecolorController(),
    );
  }
}
