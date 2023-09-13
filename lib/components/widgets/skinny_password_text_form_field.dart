import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// Custom text form field to be used in app. Requires a TextEditingController.
class SkinnyPasswordTextFormField extends StatefulWidget {
  // ignore: public_member_api_docs
  const SkinnyPasswordTextFormField({
    required this.controller,
    required this.hintText,
    this.enabled = true,
    this.borderRadius = 12,
    this.focusNode,
    this.prefixIcon,
    this.maxLines = 1,
    this.validator,
    super.key,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool enabled;
  final String hintText;
  final double borderRadius;
  final int maxLines;
  final String? Function(String?)? validator;

  @override
  State<SkinnyPasswordTextFormField> createState() =>
      _SkinnyPasswordTextFormFieldState();
}

class _SkinnyPasswordTextFormFieldState
    extends State<SkinnyPasswordTextFormField> {
  bool hidePassword = true;
  final theme = Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kPrimary,
      validator: widget.validator,
      controller: widget.controller,
      focusNode: widget.focusNode,
      obscureText: hidePassword,
      enabled: widget.enabled,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          child: Icon(
            hidePassword ? IconlyLight.show : IconlyLight.hide,
            color: AppColors.kPrimary,
          ),
        ),
        enabled: widget.enabled,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 18.h,
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
        focusColor: AppColors.kGreyScale100,
        hintText: widget.hintText,
        errorStyle: AppTypography.BodyMRegular.copyWith(
          color: AppColors.kAlertError,
        ),
        hintStyle: AppTypography.h5Bold.copyWith(
          color: theme.hintTextColor,
        ),
        errorMaxLines: 1,
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kDarkDisabled,
          ),
        ),
        hintMaxLines: 1,
      ),
    );
  }
}
