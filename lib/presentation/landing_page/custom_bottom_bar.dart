import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/landing_page/controllers/landing_page.controller.dart';
import 'package:pixlify/theme.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  LandingPageController get controller => Get.find<LandingPageController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomAppBar(
        padding: EdgeInsets.zero,
        color: theme.navigationBarBackgroundColor,
        child: Container(
          height: 95.h,
          width: Get.width,
          color: theme.navigationBarBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (controller.currentIndex != 0) {
                    controller.setPage(0);
                  }
                },
                child: Container(
                  height: 45.h,
                  width: 85.w,
                  child: Column(
                    children: [
                      if (controller.currentIndex == 0)
                        Icon(
                          IconlyBold.home,
                          color: AppColors.kPrimary,
                          size: 24.w,
                        )
                      else
                        Icon(
                          IconlyLight.home,
                          color: AppColors.kGreyScale500,
                          size: 24.w,
                        ),
                      Text(
                        'Home',
                        style: controller.currentIndex == 0
                            ? AppTypography.BodyXsBold.copyWith(
                                color: AppColors.kPrimary,
                              )
                            : AppTypography.BodyXsMedium.copyWith(
                                color: AppColors.kGreyScale500,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (controller.currentIndex != 1) {
                    controller.setPage(1);
                  }
                },
                child: Container(
                  height: 45.h,
                  width: 85.w,
                  child: Column(
                    children: [
                      if (controller.currentIndex == 1)
                        Icon(
                          IconlyBold.category,
                          color: AppColors.kPrimary,
                          size: 24.w,
                        )
                      else
                        Icon(
                          IconlyLight.category,
                          color: AppColors.kGreyScale500,
                          size: 24.w,
                        ),
                      Text(
                        'AI Toolbox',
                        style: controller.currentIndex == 1
                            ? AppTypography.BodyXsBold.copyWith(
                                color: AppColors.kPrimary,
                              )
                            : AppTypography.BodyXsMedium.copyWith(
                                color: AppColors.kGreyScale500,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (controller.currentIndex != 2) {
                    controller.setPage(2);
                  }
                },
                child: Container(
                  height: 45.h,
                  width: 85.w,
                  child: Column(
                    children: [
                      if (controller.currentIndex == 2)
                        Icon(
                          IconlyBold.profile,
                          color: AppColors.kPrimary,
                          size: 24.w,
                        )
                      else
                        Icon(
                          IconlyLight.profile,
                          color: AppColors.kGreyScale500,
                          size: 24.w,
                        ),
                      Text(
                        'Account',
                        style: controller.currentIndex == 2
                            ? AppTypography.BodyXsBold.copyWith(
                                color: AppColors.kPrimary,
                              )
                            : AppTypography.BodyXsMedium.copyWith(
                                color: AppColors.kGreyScale500,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
