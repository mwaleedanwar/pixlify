import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

/// Privacy policy screen
class PrivacyPolicyScreen extends StatelessWidget {
  /// Constructor
  const PrivacyPolicyScreen({super.key});

  /// Access account controller
  AccountController get controller => Get.find<AccountController>();

  /// Access theme service
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
          'Privacy Policy',
          style: AppTypography.h4Bold.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        children: [
          Text(
            controller.par1,
            style: AppTypography.BodyXlRegular.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'Information We Collect',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            controller.par2,
            style: AppTypography.BodyXlRegular.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Text(
            'How We Use Your Information',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            controller.par3,
            style: AppTypography.BodyXlRegular.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
