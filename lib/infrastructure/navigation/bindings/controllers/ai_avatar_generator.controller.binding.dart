import 'package:get/get.dart';

import '../../../../presentation/ai_avatar_generator/controllers/ai_avatar_generator.controller.dart';

class AiAvatarGeneratorControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiAvatarGeneratorController>(
      () => AiAvatarGeneratorController(),
    );
  }
}
