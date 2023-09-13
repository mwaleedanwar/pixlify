import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/ai_batch_enhance/controllers/ai_batch_enhance.controller.dart';
import 'package:pixlify/theme.dart';

class BatchEnhanceResult extends StatelessWidget {
  const BatchEnhanceResult({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiBatchEnhanceController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Batch Enhance Photos',
              style:
                  AppTypography.h4Bold.copyWith(color: theme.primaryTextColor),
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
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyLight.download,
                  color: theme.defaultIconColor,
                  size: 28.w,
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              ComparisonImage(),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.images.length,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemBuilder: (context, index) => BatchEnhanceResultThumbnail(
                    index,
                  ),
                ),
              ),
            ],
          ),
          bottomSheet: Container(
            width: Get.width,
            height: 120.h,
            color: theme.scaffoldColor,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButtonLite(
                  width: 180,
                  onTap: () {
                    Get.back<void>();
                  },
                  label: 'Enhance More',
                ),
                RoundedButton(
                  width: 180,
                  onTap: () {
                    Get
                      ..back<void>()
                      ..back<void>()
                      ..back<void>();
                  },
                  label: 'Download All',
                  color: AppColors.kPrimary,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class BatchEnhanceResultThumbnail extends StatelessWidget {
  final int index;
  const BatchEnhanceResultThumbnail(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiBatchEnhanceController>(
      builder: (controller) => InkWell(
        onTap: () => controller.updateCurrentImageIndex(index),
        child: Container(
          width: 85.w,
          height: 85.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: index == controller.currentIndex
                ? Border.all(
                    color: AppColors.kPrimary,
                    width: 2.w,
                  )
                : null,
            image: DecorationImage(
              image: FileImage(controller.images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class ComparisonImage extends StatelessWidget {
  const ComparisonImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiBatchEnhanceController>(
      init: AiBatchEnhanceController(),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ImageCompareSlider(
            itemOne: Image.network(
              'https://s3.envato.com/files/281015164/645Z3864%20copy.jpg',
              fit: BoxFit.cover,
              width: 382.w,
              height: 573.h,
            ),
            itemTwo: Image.network(
              'https://s3.envato.com/files/259438979/645Z4740%20copy.jpg',
              fit: BoxFit.cover,
              width: 382.w,
              height: 573.h,
            ),
            itemOneBuilder: (child, context) => ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: SizedBox(
                width: 382.w,
                height: 573.h,
                child: child,
              ),
            ),
            itemTwoBuilder: (child, context) => ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: SizedBox(
                width: 382.w,
                height: 573.h,
                child: child,
              ),
            ),
            dividerWidth: 2.w,
            handleFollowsPosition: true,
            handleRadius: BorderRadius.circular(100.r),
            handleSize: Size(40.w, 40.w),
            changePositionOnHover: true,
            handlePosition: 0.8,
            fillHandle: true,
          ),
        );
      },
    );
  }
}
