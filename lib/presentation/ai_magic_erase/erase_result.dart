import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/ai_magic_erase/controllers/ai_magic_erase.controller.dart';

/// Select area from image to be removed.
class EraseResult extends StatelessWidget {
  const EraseResult({super.key});

  AiMagicEraseController get controller => Get.find<AiMagicEraseController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Magic Eraser Photo',
          style: AppTypography.h4Bold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back<void>();
          },
          icon: Icon(
            IconlyLight.arrow_left,
            color: AppColors.kPrimary,
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
        color: AppColors.kWhite,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedButtonLite(
              width: 180,
              onTap: () {
                Get.back<void>();
              },
              label: 'Erase More',
            ),
            RoundedButton(
              width: 180,
              onTap: () {
                Get
                  ..back<void>()
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
