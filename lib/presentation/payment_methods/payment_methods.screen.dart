import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/payment_methods/add_new_payment.dart';
import 'package:pixlify/presentation/payment_methods/controllers/payment_methods.controller.dart';
import 'package:pixlify/theme.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodsController>(
      init: PaymentMethodsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back<void>(),
              icon: Icon(
                IconlyLight.arrow_left,
              ),
            ),
            title: Text(
              'Payment Methods',
              style: AppTypography.h4Bold,
            ),
            centerTitle: true,
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => ConnectedPaymentMethodTile(index),
            separatorBuilder: (context, index) => SizedBox(
              height: 24.h,
            ),
            padding: EdgeInsets.only(top: 30.h, bottom: 130.h),
            itemCount: controller.paymentMethods.length,
          ),
          bottomSheet: Container(
            width: Get.width,
            height: 120.h,
            decoration: BoxDecoration(
              color: theme.scaffoldColor,
              border: Border(
                top: BorderSide(
                  color: theme.bottomSheetBorderColor,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Center(
              child: RoundedButton(
                width: Get.width - 32.w,
                onTap: () {
                  Get.to<Widget>(
                    AddNewPaymentScreen.new,
                    transition: Transition.downToUp,
                  );
                },
                label: 'Add New Payment',
              ),
            ),
          ),
        );
      },
    );
  }
}

class ConnectedPaymentMethodTile extends StatelessWidget {
  final int index;
  const ConnectedPaymentMethodTile(this.index, {super.key});
  PaymentMethodsController get controller =>
      Get.find<PaymentMethodsController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(
        horizontal: 24.w,
      ),
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
          const Spacer(),
          Text(
            'Connected',
            style: AppTypography.BodyXlBold.copyWith(
              color: AppColors.kPrimary,
            ),
          )
        ],
      ),
    );
  }
}
