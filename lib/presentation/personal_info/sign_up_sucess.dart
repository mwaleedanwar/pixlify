import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// Sign up success dialog. Use with Get.dialog(SignUpSuccess());
class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({super.key});
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
              Images.successDialog,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Sign up Successful!',
            style: AppTypography.h4Bold.copyWith(
              color: AppColors.kPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Please wait...\nYou will be directed to the homepage.',
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
