import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/skinny_password_text_form_field.dart';
import 'package:pixlify/components/widgets/skinny_text_form_field.dart';
import 'package:pixlify/theme.dart';

import 'controllers/forgot_password.controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<ForgotPasswordController>(
      init: ForgotPasswordController(),
      initState: (_) {},
      builder: (controller) {
        if (controller.loading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: PageView(
            controller: controller.pageController,
            children: const [
              ForgetPasswordEmail(),
              ForgetPasswordOTP(),
              ForgetPasswordNewPassword(),
            ],
          ),
        );
      },
    );
  }
}

/// First page of the forget password process. Email is enter and then verified
class ForgetPasswordEmail extends StatelessWidget {
  const ForgetPasswordEmail({super.key});
  ForgotPasswordController get controller =>
      Get.find<ForgotPasswordController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  Get.back<void>();
                },
                child: Icon(
                  IconlyLight.arrow_left,
                  size: 28.w,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Reset your password 🔑',
                style: AppTypography.h3Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Please enter your email and we will send an OTP code in the next step to reset your password.',
                maxLines: 4,
                style: AppTypography.BodyXlRegular.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Email',
                style: AppTypography.BodyLBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SkinnyTextFormField(
                controller: controller.emailController,
                hintText: 'Email',
                suffixIcon: Icon(
                  IconlyLight.message,
                  size: 28.w,
                ),
              ),
              SizedBox(
                height: Get.height * 0.5,
              ),
              RoundedButton(
                onTap: () {
                  controller.pageController.nextPage(
                    duration: 100.milliseconds,
                    curve: Curves.easeInCubic,
                  );
                },
                label: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// OTP sent is entered and verified
class ForgetPasswordOTP extends StatelessWidget {
  const ForgetPasswordOTP({super.key});
  ForgotPasswordController get controller =>
      Get.find<ForgotPasswordController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  Get.back<void>();
                },
                child: Icon(
                  IconlyLight.arrow_left,
                  size: 28.w,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'OTP code verification 🔐',
                style: AppTypography.h3Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'We have sent an OTP code to your email and********ley@yourdomain.com. Enter the OTP code below to verify.',
                maxLines: 4,
                style: AppTypography.BodyXlRegular.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              OtpTextField(
                borderColor: theme.socialMediaLoginButtonColor,
                fillColor: theme.socialMediaLoginButtonBorderColor,
                focusedBorderColor: AppColors.kPrimary,
                fieldWidth: 70.w,
                showFieldAsBox: true,
                cursorColor: AppColors.kPrimary,
                filled: true,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                borderRadius: BorderRadius.circular(12.r),
                textStyle: AppTypography.h4Bold.copyWith(
                  color: theme.primaryTextColor,
                  height: 1,
                ),
                onSubmit: (value) {},
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  "Didn't receive email?",
                  style: AppTypography.BodyXlMedium.copyWith(
                    color: theme.primaryTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              const Countdown()
            ],
          ),
        ),
      ),
    );
  }
}

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => CountdownState();
}

class CountdownState extends State<Countdown> {
  Duration limit = 1.minutes;
  @override
  void initState() {
    super.initState();
    Timer.periodic(1.seconds, (_) {
      setState(() {
        limit = limit == 0.seconds ? 1.minutes : (limit - 1.seconds);
      });
    });
  }

  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'You can resend code in ',
          style: AppTypography.BodyXlMedium.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        Text(
          '${limit.inSeconds} ',
          style: AppTypography.BodyXlMedium.copyWith(color: AppColors.kPrimary),
        ),
        Text(
          's',
          style: AppTypography.BodyXlMedium.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
      ],
    );
  }
}

/// The user is asked to enter a new password and confirm it as well
class ForgetPasswordNewPassword extends StatelessWidget {
  const ForgetPasswordNewPassword({super.key});
  ForgotPasswordController get controller =>
      Get.find<ForgotPasswordController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  Get.back<void>();
                },
                child: Icon(
                  IconlyLight.arrow_left,
                  size: 28.w,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Create new password 🔒',
                style: AppTypography.h3Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Create your new password. If you forget it, then you have to do forgot password.',
                maxLines: 4,
                style: AppTypography.BodyXlRegular.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'New Password',
                style: AppTypography.BodyLBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SkinnyPasswordTextFormField(
                controller: controller.passwordController,
                hintText: 'New Password',
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Confirm New Password',
                style: AppTypography.BodyLBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SkinnyPasswordTextFormField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm new password',
              ),
              SizedBox(
                height: Get.height * 0.4,
              ),
              RoundedButton(
                onTap: () {
                  Get.dialog<Widget>(ResetPasswordSuccessDialog(
                      title: 'Reset Password Successful!',
                      description:
                          'Please wait...\nYou will be directed to the homepage.'));
                },
                label: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResetPasswordSuccessDialog extends StatelessWidget {
  const ResetPasswordSuccessDialog({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: theme.dialogColor,
      surfaceTintColor: theme.dialogColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 180.w,
            width: 180.w,
            child: SvgPicture.asset(
              Images.lockDialog,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            style: AppTypography.h4Bold.copyWith(
              color: AppColors.kPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            description,
            style: AppTypography.BodyLRegular.copyWith(
              color: theme.primaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: 30.h,
          ),
          SpinKitCircle(
            color: AppColors.kPrimary,
            size: 67.5.w,
          ),
        ],
      ),
    );
  }
}
