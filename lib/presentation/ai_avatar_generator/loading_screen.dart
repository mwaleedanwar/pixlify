import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/theme.dart';

class AvatarLoadingScreen extends StatelessWidget {
  const AvatarLoadingScreen({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: Icon(
            IconlyLight.arrow_left,
            color: theme.defaultIconColor,
          ),
        ),
        title: Text(
          'AI Avatar Generator',
          style: AppTypography.h4Bold.copyWith(color: theme.primaryTextColor),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 120.h),
                  itemCount: 8,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.w,
                    crossAxisSpacing: 16.w,
                  ),
                  itemBuilder: (context, index) => const PlaceholderIconTile(),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 3,
                sigmaY: 3,
              ),
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitCircle(
                      color: AppColors.kPrimary,
                      size: 80.w,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text('Generating Avatar...',
                        style: AppTypography.h4Bold
                            .copyWith(color: theme.primaryTextColor)),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "This may take a few minutes. Once it’s done, you will get 50 AI-generated avatars. Feel free to close the app.",
                      style: AppTypography.h5Medium
                          .copyWith(color: theme.primaryTextColor),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: Get.width,
        height: 120.h,
        color: theme.scaffoldColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: RoundedButtonLite(
            onTap: () {
              Get.toNamed(Routes.AI_AVATAR_GENERATOR_RESULT);
            },
            width: Get.width,
            label: 'Notify Me When it\'s Done',
          ),
        ),
      ),
    );
  }
}

class PlaceholderIconTile extends StatelessWidget {
  const PlaceholderIconTile({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183.w,
      height: 183.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: theme.isDarkMode
            ? AppColors.kGreyScale800
            : AppColors.kGreyScale200,
      ),
      alignment: Alignment.center,
      child: Icon(
        IconlyBold.profile,
        color: theme.emptyAvatarBackGroundColor,
        size: 44.w,
      ),
    );
  }
}
