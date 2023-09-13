import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/social_media.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/theme.dart';

/// First page after walkthrough. Shows available auth options.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Images.logo,
              height: 100.h,
            ),
            Text(
              'Pixlify',
              style: AppTypography.h2Bold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            Text(
              "Welcome! Let's dive in into your account!",
              style: AppTypography.BodyXlRegular.copyWith(
                color: theme.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.h,
            ),
            SocialMediaButton(
              icon: SvgPicture.asset(Images.googleLogo),
              platform: 'Google',
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            SocialMediaButton(
              icon: SvgPicture.asset(Images.appleLogo),
              platform: 'Apple',
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            SocialMediaButton(
              icon: SvgPicture.asset(Images.facebookLogo),
              platform: 'Facebook',
              onTap: () {},
            ),
            SizedBox(
              height: 20.h,
            ),
            SocialMediaButton(
              icon: SvgPicture.asset(Images.twitterLogo),
              platform: 'Twitter',
              onTap: () {},
            ),
            SizedBox(
              height: 50.h,
            ),
            RoundedButton(
              onTap: () {
                Get.toNamed(Routes.SIGN_IN);
              },
              label: 'Sign in with password',
            ),
            SizedBox(
              height: 45.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: AppTypography.BodyLMedium.copyWith(
                    color: theme.primaryTextColor,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SIGN_UP);
                  },
                  child: Text(
                    'Sign up',
                    style: AppTypography.BodyLBold.copyWith(
                      color: AppColors.kPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
