import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController get pwd => _passwordController;
  TextEditingController get email => _emailController;
  String get ph => _ph.value;
  bool get checked => _checked.value;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  RxString _ph = ''.obs;
  RxBool _checked = false.obs;
  final count = 0.obs;
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

  void check() {
    _checked.value = !_checked.value;
  }
}
