import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/ai_batch_enhance/controllers/ai_batch_enhance.controller.dart';
import 'package:pixlify/theme.dart';

class BatchEnhancePreview extends StatelessWidget {
  const BatchEnhancePreview({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiBatchEnhanceController>(
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        '${controller.images.length} photos have been uploaded',
                        style: AppTypography.h4Bold
                            .copyWith(color: theme.primaryTextColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        '${controller.images.length} photos have been uploaded and are ready to be enhanced at once.',
                        style: AppTypography.BodyXlRegular.copyWith(
                            color: theme.primaryTextColor),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                )
              ];
            },
            body: GridView.builder(
              padding: EdgeInsets.only(bottom: 120.h),
              itemCount: controller.images.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.w,
                crossAxisSpacing: 16.w,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const UploadMoreTile();
                }
                return BatchEnhancePreviewThumbnail(
                  image: controller.images[index - 1],
                  index: index - 1,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class UploadMoreTile extends StatelessWidget {
  const UploadMoreTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183.w,
      height: 183.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: TransparentColors().kRed,
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Get.back<void>();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_rounded,
              color: AppColors.kPrimary,
            ),
            Text(
              'Upload More',
              style: AppTypography.BodyMSemiBold.copyWith(
                color: AppColors.kPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatchEnhancePreviewThumbnail extends StatelessWidget {
  final File image;
  final int index;
  const BatchEnhancePreviewThumbnail({
    required this.image,
    required this.index,
    super.key,
  });
  AiBatchEnhanceController get controller =>
      Get.find<AiBatchEnhanceController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183.w,
      height: 183.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(image: FileImage(image), fit: BoxFit.cover),
      ),
      alignment: Alignment.topRight,
      padding: EdgeInsets.all(10.w),
      child: InkWell(
        onTap: () {
          controller.removeImage(index);
        },
        child: Container(
          width: 24.w,
          height: 24.w,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.kPrimary,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            Images.replaceIcon,
            color: AppColors.kWhite,
            width: 16.w,
            height: 16.w,
          ),
        ),
      ),
    );
  }
}
