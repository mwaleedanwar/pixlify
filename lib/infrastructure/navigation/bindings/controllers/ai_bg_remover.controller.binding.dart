import 'package:get/get.dart';

import '../../../../presentation/ai_bg_remover/controllers/ai_bg_remover.controller.dart';

class AiBgRemoverControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AiBgRemoverController>(
      () => AiBgRemoverController(),
    );
  }
}
