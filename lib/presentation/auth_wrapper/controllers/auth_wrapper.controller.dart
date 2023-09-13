import 'package:get/get.dart';

class AuthWrapperController extends GetxController {
  bool get signedIn => _signedIn.value;
  RxBool _signedIn = false.obs;
  //TODO: Implement AuthWrapperController

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

  void signIn() => _signedIn.value = true;
  void signOut() => _signedIn.value = false;
}
