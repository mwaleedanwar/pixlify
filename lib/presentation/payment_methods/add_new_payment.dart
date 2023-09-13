import 'package:flutter/cupertino.dart';
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
import 'package:pixlify/components/widgets/skinny_text_form_field.dart';
import 'package:pixlify/presentation/payment_methods/controllers/payment_methods.controller.dart';
import 'package:pixlify/theme.dart';

class AddNewPaymentScreen extends StatelessWidget {
  const AddNewPaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back<void>(),
            icon: Icon(Icons.close_rounded),
          ),
          title: Text('Add New Payment'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(IconlyLight.scan),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                SvgPicture.asset(Images.cardAsset),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Card Holder Name',
                  style: AppTypography.BodyLBold,
                ),
                SkinnyTextFormField(
                  controller: controller.cardHolderName,
                  hintText: 'Name on Card',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Card Number',
                  style: AppTypography.BodyLBold,
                ),
                SkinnyTextFormField(
                  controller: controller.cardNumber,
                  hintText: 'Number on Card',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'Expiry Date',
                  style: AppTypography.BodyLBold,
                ),
                SizedBox(
                  height: 14.h,
                ),
                CardExpiryDatePicker(),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'CVV',
                  style: AppTypography.BodyLBold,
                ),
                SkinnyTextFormField(
                  controller: controller.cardCVV,
                  hintText: '3 Digits on the back of Card',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: RoundedButton(
                    width: Get.width,
                    onTap: () {
                      controller.addPaymentMethod();
                      Get.back<void>();
                    },
                    label: 'Continue',
                    color: AppColors.kPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardExpiryDatePicker extends StatelessWidget {
  const CardExpiryDatePicker({Key? key}) : super(key: key);
  PaymentMethodsController get controller =>
      Get.find<PaymentMethodsController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.bottomSheet<Widget>(
          Container(
            height: 300.h,
            decoration: BoxDecoration(
              color: theme.bottomSheetColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: CupertinoTheme(
              data: CupertinoThemeData(
                brightness:
                    theme.isDarkMode ? Brightness.dark : Brightness.light,
              ),
              child: CupertinoDatePicker(
                backgroundColor: theme.bottomSheetColor,
                dateOrder: DatePickerDateOrder.mdy,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  controller.enterExpiryDate(newDateTime);
                },
              ),
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.kGreyScale500, width: 1.w),
          ),
        ),
        height: 40.h,
        width: Get.width,
        child: Row(
          children: [
            if (controller.cardExpiryDate == null)
              Text(
                'MM/DD/YYYY',
                style: AppTypography.h5Bold.copyWith(
                  color: theme.hintTextColor,
                ),
              )
            else
              Text(
                DateFormat.yMd().format(controller.cardExpiryDate!),
                style: AppTypography.h5Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            const Spacer(),
            Icon(
              IconlyLight.calendar,
              color: theme.defaultIconColor,
              size: 28.w,
            ),
          ],
        ),
      ),
    );
  }
}
