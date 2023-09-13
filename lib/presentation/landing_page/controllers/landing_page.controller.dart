import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixlify/presentation/screens.dart';

class LandingPageController extends GetxController {
  final pages = const <Widget>[
    HomeViewScreen(),
    AiToolboxScreen(),
    AccountScreen(),
  ];

  int get currentIndex => _currentIndex.value;
  RxInt _currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setPage(int index) => _currentIndex.value = index;
}
