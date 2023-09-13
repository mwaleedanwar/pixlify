import 'package:get/get.dart';

import '../../../../presentation/ai_batch_enhance/controllers/ai_batch_enhance.controller.dart';

class AiBatchEnhanceControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiBatchEnhanceController>(
      () => AiBatchEnhanceController(),
    );
  }
}
