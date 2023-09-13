import 'package:get/get.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthWrapperController>(AuthWrapperController.new, fenix: true);
  }
}
