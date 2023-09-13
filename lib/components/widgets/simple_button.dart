import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

/// Basic button that will be used throughout the app
class SimpleButton extends StatelessWidget {
  // ignore: public_member_api_docs
  const SimpleButton({
    required this.onTap,
    required this.label,
    this.borderRadius = 12,
    this.width,
    this.fillColor,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final String label;
  final double? width;
  final Color? fillColor;
  final double? height;
  final double borderRadius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height?.w ?? 18.h,
        ),
        width: width?.w ?? Get.width,
        decoration: BoxDecoration(
          color: fillColor ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        child: Center(
          child: Text(
            label,
            style: (style ?? AppTypography.BodyXlBold).copyWith(
              color: AppColors.kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
