import 'package:get/get.dart';

import '../../../../presentation/home_view/controllers/home_view.controller.dart';

class HomeViewControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
      () => HomeViewController(),
    );
  }
}
