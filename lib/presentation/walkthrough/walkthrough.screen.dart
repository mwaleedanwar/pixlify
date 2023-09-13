import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'controllers/walkthrough.controller.dart';

class WalkthroughScreen extends StatelessWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<WalkthroughController>(
      init: WalkthroughController(),
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: PageView(
                          controller: controller.pageController,
                          children: const [
                            WalkthroughScreenOne(),
                            WalkthroughScreenTwo(),
                            WalkthroughScreenThree(),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.5),
                        child: SmoothPageIndicator(
                          controller: controller.pageController,
                          effect: WormEffect(
                            activeDotColor: AppColors.kPrimary,
                            dotColor: theme.pageTabColor,
                          ),
                          count: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            width: Get.width,
            color: AppColors.kWhite,
            height: 118.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!controller.end)
                  RoundedButtonLite(
                    onTap: () {
                      Get.offAndToNamed(Routes.AUTH_WRAPPER);
                    },
                    label: 'Skip',
                  ),
                RoundedButton(
                  onTap: controller.nextPage,
                  width: controller.end ? Get.width : 200.w,
                  label: controller.end ? 'Continue' : 'Next',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// First screen of the initial walkthrough
class WalkthroughScreenOne extends StatelessWidget {
  const WalkthroughScreenOne({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome1),
        ),
        Align(
          alignment: Alignment(0, 0.35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width,
                height: 140.h,
                decoration: BoxDecoration(
                  gradient: theme.imageFadeMask,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.scaffoldColor,
                ),
                child: Column(
                  children: [
                    Text(
                      'Enhance your photos instantly in one click',
                      maxLines: 2,
                      style: AppTypography.h3Bold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                      maxLines: 3,
                      style: AppTypography.BodyXlRegular.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WalkthroughScreenTwo extends StatelessWidget {
  const WalkthroughScreenTwo({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome2),
        ),
        Align(
          alignment: Alignment(0, 0.35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width,
                height: 140.h,
                decoration: BoxDecoration(
                  gradient: theme.imageFadeMask,
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.kWhite),
                child: Column(
                  children: [
                    Text(
                      'Unleash your creativity with AI toolbox',
                      maxLines: 2,
                      style: AppTypography.h3Bold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                      maxLines: 2,
                      style: AppTypography.BodyXlRegular.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WalkthroughScreenThree extends StatelessWidget {
  const WalkthroughScreenThree({super.key});
  WalkthroughController get controller => Get.find<WalkthroughController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(Images.welcome3),
        ),
        Align(
          alignment: Alignment(0, 0.35),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Get.width,
                height: 140.h,
                decoration: BoxDecoration(
                  gradient: theme.imageFadeMask,
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.kWhite),
                child: Column(
                  children: [
                    Text(
                      'Enjoy all the benefits with pro subscriptions',
                      maxLines: 2,
                      style: AppTypography.h3Bold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor...',
                      maxLines: 2,
                      style: AppTypography.BodyXlRegular.copyWith(
                        color: theme.primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 150.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
