import 'package:get/get.dart';

import '../../../../presentation/ai_magic_erase/controllers/ai_magic_erase.controller.dart';

class AiMagicEraseControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiMagicEraseController>(
      () => AiMagicEraseController(),
    );
  }
}
