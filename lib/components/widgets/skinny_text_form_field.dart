import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// Custom text form field to be used in app. Requires a TextEditingController.
class SkinnyTextFormField extends StatelessWidget {
  // ignore: public_member_api_docs
  const SkinnyTextFormField({
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.enabled = true,
    this.borderRadius = 12,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.validator,
    this.width,
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
  final int maxLines;
  final String? Function(String?)? validator;
  final double? width;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kPrimary,
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      enabled: enabled,
      style: AppTypography.h5Bold.copyWith(
        color: theme.primaryTextColor,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          maxHeight: 40.h,
        ),
        enabled: enabled,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
        ),
        constraints: BoxConstraints(
          maxWidth: width ?? Get.width,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.textBoxUnfocusedBorderColor,
            width: 1.w,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.textBoxUnfocusedBorderColor,
            width: 1.w,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 3.w,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimary,
            width: 2.w,
          ),
        ),
        hintText: hintText,
        errorStyle: AppTypography.BodyMRegular.copyWith(
          color: AppColors.kAlertError,
        ),
        hintStyle: AppTypography.h5Bold.copyWith(
          color: theme.hintTextColor,
        ),
        errorMaxLines: 1,
        disabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide(
            color: AppColors.kDarkDisabled,
          ),
        ),
        hintMaxLines: 1,
      ),
    );
  }
}
