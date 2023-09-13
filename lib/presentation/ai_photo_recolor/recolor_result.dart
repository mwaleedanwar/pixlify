import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/ai_photo_recolor/controllers/ai_photo_recolor.controller.dart';
import 'package:pixlify/theme.dart';

/// Select area from image to be removed.
class PhotoRecolorResult extends StatelessWidget {
  const PhotoRecolorResult({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AiPhotoRecolorController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'AI Photo Recoloring',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
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
              SizedBox(
                height: 573.h,
                width: Get.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.file(
                        controller.image!,
                        height: 573.h,
                        width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: const BoxDecoration(
                              color: AppColors.kPrimary,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyLight.arrow_down,
                              color: AppColors.kWhite,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                height: 190.h,
                child: ListView.separated(
                  itemBuilder: (context, index) => Center(
                    child: RecolorThumbnail(
                      image: controller.image!,
                      filterName: controller.filters[index],
                      selected: controller.selectedFilterIndex == index,
                      index: index,
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemCount: controller.filters.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Thumbnail of image with applied filter.
/// Shows image and filter name.
class RecolorThumbnail extends StatelessWidget {
  const RecolorThumbnail({
    required this.image,
    required this.filterName,
    required this.selected,
    required this.index,
    super.key,
  });
  final File image;
  final String filterName;
  final bool selected;
  final int index;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.find<AiPhotoRecolorController>().setFilterByIndex(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 117.w,
              maxWidth: 117.w,
            ),
            decoration: BoxDecoration(
              border: selected
                  ? Border.all(
                      color: AppColors.kPrimary,
                      width: 3.w,
                    )
                  : null,
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: FileImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            filterName,
            style: AppTypography.BodyXlSemiBold.copyWith(
              color: selected ? AppColors.kPrimary : null,
            ),
          )
        ],
      ),
    );
  }
}
