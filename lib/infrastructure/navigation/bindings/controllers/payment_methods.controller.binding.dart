import 'package:get/get.dart';

import '../../../../presentation/payment_methods/controllers/payment_methods.controller.dart';

class PaymentMethodsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentMethodsController>(
      () => PaymentMethodsController(),
    );
  }
}
