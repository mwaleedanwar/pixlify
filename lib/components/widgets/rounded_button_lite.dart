import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// Simple rounded button counterpart to simple button
class RoundedButtonLite extends StatelessWidget {
  const RoundedButtonLite({
    required this.onTap,
    required this.label,
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

  ThemeService get theme => Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: onTap,
      child: Container(
        width: (width ?? 183).w,
        height: (height ?? 58).h,
        decoration: BoxDecoration(
          color: color ?? theme.roundButtonLiteColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: (style ?? AppTypography.BodyLBold).copyWith(
            color: theme.roundButtonLiteTextColor,
          ),
        ),
      ),
    );
  }
}
