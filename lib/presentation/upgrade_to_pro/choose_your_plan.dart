import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/upgrade_to_pro/controllers/upgrade_to_pro.controller.dart';
import 'package:pixlify/presentation/upgrade_to_pro/select_payment_method.dart';
import 'package:pixlify/theme.dart';

/// Plan for choosing the relevant PRO plan
class ChooseYourPlan extends StatelessWidget {
  const ChooseYourPlan({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpgradeToProController>(
      init: UpgradeToProController(),
      builder: (controller) {
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
              'Choose Your Plan',
              style: AppTypography.h4Bold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => PlanTile(index),
            separatorBuilder: (context, index) => SizedBox(
              height: 24.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 30.h),
            itemCount: controller.plans.length,
          ),
          bottomSheet: Container(
            width: Get.width,
            height: 120.h,
            decoration: BoxDecoration(
              color: theme.scaffoldColor,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 30.h,
            ),
            child: RoundedButton(
              width: Get.width - 32.w,
              onTap: () => Get.to<Widget>(SelectPaymentMethod.new),
              label: 'Continue',
              color: AppColors.kPrimary,
            ),
          ),
        );
      },
    );
  }
}

/// Tile widget for each plan
class PlanTile extends StatelessWidget {
  final int index;
  const PlanTile(this.index, {super.key});
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.selectPlan(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        margin: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          color: theme.socialMediaLoginButtonColor,
          border: Border.all(
            color: controller.selectedPlanIndex == index
                ? AppColors.kPrimary
                : theme.socialMediaLoginButtonBorderColor,
            width: controller.selectedPlanIndex == index ? 3.w : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.plans[index].duration,
                  style: AppTypography.h4Bold.copyWith(
                    color: theme.primaryTextColor,
                  ),
                ),
                Text(controller.plans[index].description,
                    style: AppTypography.BodyMMedium.copyWith(
                      color: theme.primaryTextColor,
                    )),
              ],
            ),
            Spacer(),
            Text(
                NumberFormat.currency(
                  locale: 'en_IN',
                  symbol: r'$',
                  decimalDigits: 2,
                ).format(
                  controller.plans[index].price,
                ),
                style: AppTypography.h4Bold.copyWith(
                  color: theme.primaryTextColor,
                )),
            Radio<int?>(
              value: index,
              groupValue: controller.selectedPlanIndex,
              onChanged: (value) => controller.selectPlan(value ?? 0),
              activeColor: AppColors.kPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
