import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/upgrade_to_pro/controllers/upgrade_to_pro.controller.dart';
import 'package:pixlify/theme.dart';

class ReivewSummary extends StatelessWidget {
  const ReivewSummary({super.key});
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Review Summary',
          style: AppTypography.h4Bold.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: Icon(
            IconlyLight.arrow_left,
            color: theme.defaultIconColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            PurchasedPlanCard(controller.selectedPlanIndex),
            SizedBox(
              height: 20.h,
            ),
            TotalCostCard(controller.plans[controller.selectedPlanIndex].price),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Selected Payment Method',
              style: AppTypography.h5Bold,
            ),
            SizedBox(
              height: 20.h,
            ),
            SelectedPaymentMethodTile(controller.selectedPaymentMethodIndex),
          ],
        ),
      ),
      bottomSheet: Container(
        width: Get.width,
        height: 120.h,
        decoration: BoxDecoration(
          color: theme.scaffoldColor,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
        alignment: Alignment.center,
        child: RoundedButton(
          width: Get.width - 32.w,
          onTap: () {
            Get.dialog<Widget>(const UpgradeSuccessDialog());
          },
          label: 'Confirm Payment',
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}

class PurchasedPlanCard extends StatelessWidget {
  final int index;
  const PurchasedPlanCard(this.index, {super.key});
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 120.h,
      decoration: BoxDecoration(
        color: theme.socialMediaLoginButtonColor,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
        border: Border.all(
          color: theme.socialMediaLoginButtonBorderColor,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subscription',
                style: AppTypography.BodyXlMedium.copyWith(
                  color: theme.subtextColor,
                ),
              ),
              Text(
                controller.plans[index].duration,
                style: AppTypography.BodyXlSemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price',
                style: AppTypography.BodyXlMedium.copyWith(
                  color: theme.subtextColor,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'en_US',
                  symbol: r'$',
                ).format(controller.plans[index].price),
                style: AppTypography.BodyXlSemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TotalCostCard extends StatelessWidget {
  const TotalCostCard(this.cost, {super.key});
  final double cost;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 180.h,
      decoration: BoxDecoration(
        color: theme.socialMediaLoginButtonColor,
        borderRadius: BorderRadius.circular(
          12.r,
        ),
        border: Border.all(
          color: theme.socialMediaLoginButtonBorderColor,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount',
                style: AppTypography.BodyXlMedium.copyWith(
                  color: theme.subtextColor,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'en_US',
                  symbol: r'$',
                ).format(cost),
                style: AppTypography.BodyXlSemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: AppTypography.BodyXlMedium.copyWith(
                  color: theme.subtextColor,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'en_US',
                  symbol: r'$',
                ).format(1),
                style: AppTypography.BodyXlSemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
          Divider(
            color: theme.primaryDividerColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: AppTypography.BodyXlMedium.copyWith(
                  color: theme.subtextColor,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'en_US',
                  symbol: r'$',
                ).format(cost + 1),
                style: AppTypography.BodyXlSemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SelectedPaymentMethodTile extends StatelessWidget {
  const SelectedPaymentMethodTile(this.index, {super.key});
  final int index;
  UpgradeToProController get controller => Get.find<UpgradeToProController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: theme.socialMediaLoginButtonColor,
        border: Border.all(
          color: theme.socialMediaLoginButtonBorderColor,
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
          InkWell(
            onTap: () => Get.back<void>(),
            child: Text(
              'Change',
              style: AppTypography.BodyXlBold.copyWith(
                color: AppColors.kPrimary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UpgradeSuccessDialog extends StatelessWidget {
  const UpgradeSuccessDialog({super.key});
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
            height: 32.h,
          ),
          SvgPicture.asset(
            Images.proSuccessDialogIcon,
          ),
          SizedBox(
            height: 32.h,
          ),
          Text(
            'Welcome to PRO Plan!',
            style: AppTypography.h4Bold.copyWith(
              color: AppColors.kPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'You have successfully subscribed Pro for 6 months! E-Receipt has been sent to your email address. Enjoy all the benefits!',
            style: AppTypography.BodyLRegular.copyWith(
              color: theme.primaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
          SizedBox(
            height: 32.h,
          ),
          RoundedButton(
            onTap: () => Get.back<void>(),
            label: 'Ok',
          )
        ],
      ),
    );
  }
}
