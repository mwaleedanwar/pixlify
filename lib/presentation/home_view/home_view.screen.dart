import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/home_view/confirm_image_enhance_dialog.dart';
import 'package:pixlify/presentation/landing_page/controllers/landing_page.controller.dart';
import 'package:pixlify/theme.dart';

import 'controllers/home_view.controller.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<HomeViewController>(
      init: HomeViewController(),
      initState: (_) {},
      builder: (controller) {
        if (controller.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return Padding(
          padding: EdgeInsets.only(
            right: 24.w,
            left: 24.w,
          ),
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 30.w,
              leading: SizedBox(
                height: 28.w,
                width: 28.w,
                child: SvgPicture.asset(Images.logo),
              ),
              title: Text(
                'Pixlify',
                style: AppTypography.h4Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              centerTitle: true,
            ),
            body: NestedScrollView(
              physics: controller.recentImages.isEmpty
                  ? const NeverScrollableScrollPhysics()
                  : null,
              headerSliverBuilder: (context, value) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        AIToolboxBannerHome(),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Photos',
                              style: AppTypography.h4Bold.copyWith(
                                color: theme.primaryTextColor,
                              ),
                            ),
                            const Spacer(),
                            RoundedButtonLite(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                              },
                              label: 'Open Gallery',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ];
              },
              body: controller.error
                  ? Center(
                      child: Text(
                        'Error',
                        style: AppTypography.h3Medium.copyWith(
                          color: theme.primaryTextColor,
                        ),
                      ),
                    )
                  : controller.recentImages.isEmpty
                      ? Center(
                          child: Text(
                            'No Images Found',
                            style: AppTypography.h1Bold.copyWith(
                              color: theme.primaryTextColor,
                            ),
                          ),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: controller.recentImages.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Get.dialog<Widget>(
                                ConfirmImageEnhanceDialog(
                                  image: controller.recentImages[index],
                                ),
                                barrierDismissible: false,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6.0.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.file(
                                    controller.recentImages[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ),
        );
      },
    );
  }
}

class AIToolboxBannerHome extends StatelessWidget {
  const AIToolboxBannerHome({super.key});

  LandingPageController get controller => Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: SizedBox(
        width: Get.width,
        height: 200.h,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                Images.boxBackground,
                height: 200.h,
              ),
            ),
            Align(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.kPrimary,
                      AppColors.kPrimary.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 250.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AI Toolbox',
                        style: AppTypography.h4Bold.copyWith(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Unleash your creativity and try our AI Toolbox now!',
                        style: AppTypography.BodyLMedium.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      RoundedButton(
                        onTap: () {
                          controller.setPage(1);
                        },
                        label: 'Try Now',
                        color: AppColors.kWhite,
                        style: AppTypography.BodyMSemiBold.copyWith(
                          color: AppColors.kPrimary,
                        ),
                        width: 100.w,
                        height: 45.h,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
