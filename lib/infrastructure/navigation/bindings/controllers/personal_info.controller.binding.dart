import 'package:get/get.dart';

import '../../../../presentation/personal_info/controllers/personal_info.controller.dart';

class PersonalInfoControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInfoController>(
      () => PersonalInfoController(),
    );
  }
}
