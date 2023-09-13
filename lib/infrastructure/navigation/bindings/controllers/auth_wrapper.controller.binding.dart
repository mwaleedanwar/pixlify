import 'package:get/get.dart';

import '../../../../presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';

class AuthWrapperControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthWrapperController>(
      () => AuthWrapperController(),
    );
  }
}
