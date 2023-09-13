import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

/// Simple rounded button counterpart to simple button
class RoundedButtonWithIcon extends StatelessWidget {
  const RoundedButtonWithIcon({
    required this.onTap,
    required this.label,
    required this.icon,
    this.color,
    this.width,
    this.height,
    this.style,
    super.key,
  });
  final void Function() onTap;
  final String label;
  final Color? color;
  final double? width;
  final double? height;
  final TextStyle? style;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width?.w ?? Get.width,
        height: (height ?? 58).h,
        decoration: BoxDecoration(
          color: color ?? AppColors.kPrimary,
          borderRadius: BorderRadius.circular(100.r),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.w,
              color: AppColors.kWhite,
            ),
            SizedBox(
              width: 16.w,
            ),
            Text(
              label,
              style: style ??
                  AppTypography.BodyLBold.copyWith(
                    color: AppColors.kWhite,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
