import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/upgrade_to_pro/controllers/upgrade_to_pro.controller.dart';
import 'package:pixlify/presentation/upgrade_to_pro/review_summary.dart';
import 'package:pixlify/theme.dart';

class SelectPaymentMethod extends StatelessWidget {
  const SelectPaymentMethod({super.key});
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
              'Select Payment Method',
              style: AppTypography.h4Bold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => PaymentMethodTile(index),
            separatorBuilder: (context, index) => SizedBox(
              height: 24.h,
            ),
            padding: EdgeInsets.symmetric(vertical: 30.h),
            itemCount: controller.paymentMethods.length,
          ),
          bottomSheet: Container(
            width: Get.width,
            height: 120.h,
            decoration: BoxDecoration(
              color: theme.scaffoldColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: RoundedButton(
              width: Get.width - 32.w,
              onTap: () => Get.to<Widget>(ReivewSummary.new),
              label: 'Continue',
              color: AppColors.kPrimary,
            ),
          ),
        );
      },
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final int index;
  const PaymentMethodTile(this.index, {super.key});
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.selectPaymentMethod(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        margin: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          color: theme.socialMediaLoginButtonColor,
          border: Border.all(
            color: controller.selectedPaymentMethodIndex == index
                ? AppColors.kPrimary
                : theme.socialMediaLoginButtonBorderColor,
            width: controller.selectedPaymentMethodIndex == index ? 3.w : 1,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Image.asset(
              controller.paymentMethods[index].image,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              controller.paymentMethods[index].name,
              style: AppTypography.h6Bold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            Spacer(),
            Radio<int?>(
              value: index,
              groupValue: controller.selectedPaymentMethodIndex,
              onChanged: (value) => controller.selectPaymentMethod(value ?? 0),
              activeColor: AppColors.kPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
