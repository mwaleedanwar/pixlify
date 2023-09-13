import 'package:get/get.dart';

import '../../../../presentation/ai_extend_image/controllers/ai_extend_image.controller.dart';

class AiExtendImageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiExtendImageController>(
      () => AiExtendImageController(),
    );
  }
}
