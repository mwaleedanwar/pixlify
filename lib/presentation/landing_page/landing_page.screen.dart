import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pixlify/presentation/landing_page/custom_bottom_bar.dart';
import 'package:pixlify/theme.dart';

import 'controllers/landing_page.controller.dart';

/// Root of all pages. Contains Navigation Bottom Bar.
class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<LandingPageController>(
      init: LandingPageController(),
      initState: (_) {},
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            controller.setPage(0);
            return false;
          },
          child: Scaffold(
            body: controller.pages[controller.currentIndex],
            bottomNavigationBar: const CustomBottomBar(),
          ),
        );
      },
    );
  }
}
