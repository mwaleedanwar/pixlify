import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/home_view/controllers/home_view.controller.dart';
import 'package:pixlify/presentation/home_view/enhancec_home_result.dart';
import 'package:pixlify/theme.dart';

class ConfirmImageEnhanceDialog extends StatelessWidget {
  const ConfirmImageEnhanceDialog({required this.image, super.key});
  final File image;
  HomeViewController get controller => Get.find<HomeViewController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: theme.dialogColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(image, fit: BoxFit.fitWidth),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RoundedButton(
                  onTap: () {
                    controller.selectedImage = image;
                    Get.to<Widget>(EnhanceHomeResult.new);
                  },
                  label: 'Enhance',
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          IconButton(
            onPressed: () => Get.back<void>(),
            icon: Icon(
              Icons.close_rounded,
              color: AppColors.kWhite,
              size: 50.w,
            ),
          ),
        ],
      ),
    );
  }
}
