import 'package:get/get.dart';

import 'package:pixlify/presentation/walkthrough/controllers/walkthrough.controller.dart';

class WalkthroughControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkthroughController>(
      WalkthroughController.new,
    );
  }
}
