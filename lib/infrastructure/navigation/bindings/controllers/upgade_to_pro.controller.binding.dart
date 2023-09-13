import 'package:get/get.dart';

import '../../../../presentation/upgrade_to_pro/controllers/upgrade_to_pro.controller.dart';

class UpgadeToProControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpgradeToProController>(
      () => UpgradeToProController(),
    );
  }
}
