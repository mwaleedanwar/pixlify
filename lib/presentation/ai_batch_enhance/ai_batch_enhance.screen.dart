import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/ai_batch_enhance/batch_enahnce_preview.dart';
import 'package:pixlify/presentation/ai_batch_enhance/batch_enhance_result.dart';
import 'package:pixlify/presentation/ai_batch_enhance/controllers/ai_batch_enhance.controller.dart';
import 'package:pixlify/theme.dart';

class AiBatchEnhanceScreen extends StatelessWidget {
  const AiBatchEnhanceScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<AiBatchEnhanceController>(
      init: AiBatchEnhanceController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Batch Enhance Photos',
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
        body: controller.images.isNotEmpty
            ? const BatchEnhancePreview()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      'Upload a batch of photos',
                      style: AppTypography.h4Bold
                          .copyWith(color: theme.primaryTextColor),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Upload a group of photos or images to be enhanced at once.',
                      style: AppTypography.BodyXlRegular.copyWith(
                          color: theme.primaryTextColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await controller.addImagesGallery();
                      },
                      child: Container(
                        width: Get.width,
                        height: 382.h,
                        decoration: BoxDecoration(
                          color: TransparentColors().kRed,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              IconlyLight.upload,
                              color: AppColors.kPrimary,
                              size: 52.w,
                            ),
                            SizedBox(
                              height: 22.h,
                            ),
                            Text(
                              'Upload',
                              style: AppTypography.h5SemiBold.copyWith(
                                color: AppColors.kPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        bottomSheet: Container(
          width: Get.width,
          height: 120.h,
          color: theme.scaffoldColor,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: RoundedButton(
              onTap: () {
                if (controller.images.isNotEmpty) {
                  Get.to<Widget>(
                    BatchEnhanceResult.new,
                    transition: Transition.cupertino,
                  );
                }
              },
              label: 'Enhance',
              color: controller.images.isNotEmpty
                  ? AppColors.kPrimary
                  : AppColors.kDisabledButton,
            ),
          ),
        ),
      ),
    );
  }
}

class SelectedImagesGrid extends StatelessWidget {
  const SelectedImagesGrid({super.key});

  AiBatchEnhanceController get controller =>
      Get.find<AiBatchEnhanceController>();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
