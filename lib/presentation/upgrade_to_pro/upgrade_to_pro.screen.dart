import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/upgrade_to_pro/choose_your_plan.dart';
import 'package:pixlify/theme.dart';

import 'controllers/upgrade_to_pro.controller.dart';

class UpgadeToProScreen extends GetView<UpgradeToProController> {
  const UpgadeToProScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              Images.upgradeBackground,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.scaffoldColor.withOpacity(0),
                  theme.scaffoldColor.withOpacity(0.3),
                  theme.scaffoldColor.withOpacity(0.8),
                  theme.scaffoldColor.withOpacity(0.95),
                  theme.scaffoldColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0, 0.0677, 0.151, 0.3073, 0.4684],
              ),
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top + 12.h,
                ),
                IconButton(
                  onPressed: () => Get.back<void>(),
                  icon: Icon(
                    IconlyLight.arrow_left,
                    color: AppColors.kWhite,
                  ),
                ),
                UpgradeToProAd(),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        width: Get.width,
        height: 120.h,
        decoration: BoxDecoration(
          color: theme.scaffoldColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Center(
          child: RoundedButton(
            width: Get.width,
            onTap: () {
              Get.to<Widget>(ChooseYourPlan.new);
            },
            label: 'Upgrade to PRO',
            color: AppColors.kPrimary,
          ),
        ),
      ),
    );
  }
}

class UpgradeToProAd extends StatelessWidget {
  const UpgradeToProAd({super.key});
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 700.h,
      decoration: BoxDecoration(
        color: theme.dialogColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: 130.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              color: AppColors.kPrimary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UPGRADE TO PRO',
                  style: AppTypography.h4Bold.copyWith(
                    color: AppColors.kWhite,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Enjoy all features & benefits without any restrictions',
                  style: AppTypography.BodyLMedium.copyWith(
                    color: AppColors.kWhite,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 570.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: theme.scaffoldColor,
              border: Border(
                bottom: BorderSide(
                  color: theme.isDarkMode
                      ? AppColors.kDark3
                      : AppColors.kGreyScale100,
                  width: 1.w,
                ),
                left: BorderSide(
                  color: theme.isDarkMode
                      ? AppColors.kDark3
                      : AppColors.kGreyScale100,
                  width: 1.w,
                ),
                right: BorderSide(
                  color: theme.isDarkMode
                      ? AppColors.kDark3
                      : AppColors.kGreyScale100,
                  width: 1.w,
                ),
              ),
            ),
            child: ListView.builder(
              itemCount: controller.proBenefits.length,
              itemBuilder: (context, index) => ProAdBenefitTile(
                controller.proBenefits[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProAdBenefitTile extends StatelessWidget {
  const ProAdBenefitTile(this.benefit, {super.key});
  final String benefit;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 12.w,
      minVerticalPadding: 0,
      tileColor: theme.scaffoldColor,
      leading: Icon(
        IconlyLight.tick_square,
        color: theme.defaultIconColor,
      ),
      title: Text(benefit,
          style: AppTypography.h6Medium.copyWith(
            color: theme.primaryTextColor,
          )),
    );
  }
}
