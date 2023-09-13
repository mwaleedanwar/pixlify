import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/simple_button.dart';
import 'package:pixlify/components/widgets/simple_check_box.dart';
import 'package:pixlify/components/widgets/skinny_password_text_form_field.dart';
import 'package:pixlify/components/widgets/skinny_text_form_field.dart';

import 'package:iconly/iconly.dart';
import 'package:pixlify/components/widgets/social_media_tile.dart';
import 'package:pixlify/components/widgets/success_dialog.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/presentation/sign_in/controllers/sign_in.controller.dart';
import 'package:pixlify/presentation/sign_up/controllers/sign_up.controller.dart';
import 'package:pixlify/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<SignUpController>(
      init: SignUpController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: MediaQuery.of(context).padding.top,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back<void>();
                      },
                      icon: Icon(
                        IconlyLight.arrow_left,
                        color: theme.defaultIconColor,
                        size: 28.w,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Hello there 👋',
                      style: AppTypography.h3Bold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                    ),
                    Text(
                      'Please enter your email & password to create an account.',
                      style: AppTypography.BodyXlRegular.copyWith(
                        color: theme.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Email',
                      style: AppTypography.BodyLBold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                    ),
                    SkinnyTextFormField(
                      controller: controller.email,
                      hintText: 'Email',
                      suffixIcon: Icon(
                        IconlyLight.message,
                        size: 28.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Password',
                      style: AppTypography.BodyLBold.copyWith(
                        color: theme.primaryTextColor,
                      ),
                    ),
                    SkinnyPasswordTextFormField(
                      controller: controller.pwd,
                      hintText: 'Password',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        SimpleCheckBox(
                          checked: controller.checked,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree to the ',
                                style: AppTypography.BodyLMedium.copyWith(
                                  color: theme.primaryTextColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Pixlify Terms, & Privacy Policy.',
                                style: AppTypography.BodyLSemiBold.copyWith(
                                  color: AppColors.kPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      color: theme.primaryDividerColor,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: AppTypography.BodyLMedium.copyWith(
                            color: theme.primaryTextColor,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed(Routes.SIGN_IN);
                          },
                          child: Text(
                            'Sign In',
                            style: AppTypography.BodyLBold.copyWith(
                              color: AppColors.kPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: theme.primaryDividerColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'or continue with',
                            style: AppTypography.h6Medium.copyWith(
                              color: theme.subtextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: theme.primaryDividerColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.googleLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.appleLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.facebookLogo),
                        ),
                        SocialMediaTile(
                          onTap: () {},
                          icon: SvgPicture.asset(Images.twitterLogo),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120.h,
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            color: theme.scaffoldColor,
            padding: EdgeInsets.all(24.w),
            height: 110.h,
            child: RoundedButton(
              onTap: () async {
                Get.toNamed(Routes.PERSONAL_INFO);
              },
              label: 'Sign up',
            ),
          ),
        );
      },
    );
  }
}
