import 'package:get/get.dart';

import '../../../../presentation/landing_page/controllers/landing_page.controller.dart';

class LandingPageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(
      () => LandingPageController(),
    );
  }
}
