// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// To be shown via Get.dialog<void>(SuccessDialog()); Shows a dialog with the
/// success vector, a title and a description.
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;

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
            height: 180.w,
            width: 180.w,
            child: SvgPicture.asset(
              Images.successDialog,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            title,
            style: AppTypography.h4Bold.copyWith(
              color: AppColors.kPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            description,
            style: AppTypography.BodyLRegular.copyWith(
              color: theme.primaryTextColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: 30.h,
          ),
          SpinKitCircle(
            color: AppColors.kPrimary,
            size: 67.5.w,
          ),
        ],
      ),
    );
  }
}

Future<void> showSuccessDialog({
  required String title,
  required String description,
  bool dismissable = true,
}) async {
  await Get.dialog<Widget>(
    SuccessDialog(title: title, description: description),
    barrierDismissible: dismissable,
  );
}
