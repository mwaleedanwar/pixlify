import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';
import 'package:pixlify/presentation/screens.dart';

/// Root for wrapping the entire app in auth state.
class AuthWrapperScreen extends StatelessWidget {
  const AuthWrapperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<AuthWrapperController>(
      init: AuthWrapperController(),
      initState: (_) {},
      builder: (controller) {
        if (!controller.signedIn) {
          return const WelcomeScreen();
        }
        return const LandingPageScreen();
      },
    );
  }
}
