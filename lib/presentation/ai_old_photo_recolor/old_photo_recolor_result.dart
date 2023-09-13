import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/ai_old_photo_recolor/controllers/ai_old_photo_recolor.controller.dart';
import 'package:pixlify/theme.dart';

/// Select area from image to be removed.
class OldPhotoRecolorResult extends StatelessWidget {
  const OldPhotoRecolorResult({super.key});

  AiOldPhotoRecolorController get controller =>
      Get.find<AiOldPhotoRecolorController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Old Photo Restoration',
          style: AppTypography.h4Bold.copyWith(color: theme.primaryTextColor),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back<void>();
          },
          icon: Icon(
            IconlyLight.arrow_left,
            color: theme.defaultIconColor,
            size: 28.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 573.h,
                  maxWidth: Get.width,
                ),
                child: Image.file(
                  controller.image!,
                  height: 573.h,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        width: Get.width,
        height: 120.h,
        color: theme.scaffoldColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButton(
              width: Get.width - 36.w,
              onTap: () {
                Get
                  ..back<void>()
                  ..back<void>();
              },
              label: 'Download',
              color: AppColors.kPrimary,
            )
          ],
        ),
      ),
    );
  }
}
