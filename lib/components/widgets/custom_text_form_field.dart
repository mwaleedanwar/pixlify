import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';

/// Custom text form field to be used in app. Requires a TextEditingController.
class CustomTextFormField extends StatelessWidget {
  // ignore: public_member_api_docs
  const CustomTextFormField({
    required this.controller,
    required this.hintText,
    required this.label,
    this.isPassword = false,
    this.enabled = true,
    this.borderRadius = 12,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    super.key,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool enabled;
  final String hintText;
  final double borderRadius;
  final String? label;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      enabled: enabled,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.kGreyScale050,
        enabled: enabled,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 2.w,
          ),
        ),
        focusColor: AppColors.kGreyScale100,
        hintText: hintText,
        label: Text(
          label ?? '',
          style: AppTypography.BodyXlSemiBold,
        ),
        errorStyle: AppTypography.BodyMRegular.copyWith(
          color: AppColors.kAlertError,
        ),
        errorMaxLines: 1,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        ),
        hintMaxLines: 1,
      ),
    );
  }
}
