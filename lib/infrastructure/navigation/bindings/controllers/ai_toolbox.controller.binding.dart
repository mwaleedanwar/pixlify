import 'package:get/get.dart';

import '../../../../presentation/ai_toolbox/controllers/ai_toolbox.controller.dart';

class AiToolboxControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiToolboxController>(
      () => AiToolboxController(),
    );
  }
}
