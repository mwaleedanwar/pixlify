import 'package:get/get.dart';

import 'package:pixlify/presentation/ai_old_photo_restore/controllers/ai_old_photo_restore.controller.dart';

class AiOldPhotoRestoreControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiOldPhotoRestoreController>(
      () => AiOldPhotoRestoreController(),
    );
  }
}
