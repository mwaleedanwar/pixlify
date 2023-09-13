import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';

class WalkthroughController extends GetxController {
  bool get end => _end.value;
  PageController get pageController => _pageController;
  RxBool _end = false.obs;

  final _pageController = PageController();

  /// next page
  void nextPage() async {
    if (pageController.page == 2) {
      Get.offAndToNamed(Routes.AUTH_WRAPPER);
      return;
    }
    await pageController.nextPage(
      duration: 150.milliseconds,
      curve: Curves.easeIn,
    );
    _end.value = pageController.page == 2;
  }
}
