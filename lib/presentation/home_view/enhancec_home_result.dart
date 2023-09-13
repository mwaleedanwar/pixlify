// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_compare_slider/image_compare_slider.dart';

import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/home_view/controllers/home_view.controller.dart';
import 'package:pixlify/theme.dart';

class EnhanceHomeResult extends StatelessWidget {
  const EnhanceHomeResult({super.key});
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Enhance Photo',
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
                Icons.close_rounded,
                size: 28.w,
                color: theme.defaultIconColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet<Widget>(
                    context: context,
                    barrierColor: AppColors.kBlueBlack.withOpacity(0.6),
                    builder: (context) => BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: const SaveResultsBottomSheet(),
                    ),
                  );
                },
                icon: Icon(
                  IconlyLight.download,
                  size: 28.w,
                  color: theme.defaultIconColor,
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
                height: 125.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemBuilder: (context, index) => EnhanceHomeResultThumbnail(
                    index: index,
                    type: index == 0 ? 'Base' : 'V$index',
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class EnhanceHomeResultThumbnail extends StatelessWidget {
  const EnhanceHomeResultThumbnail({
    required this.index,
    required this.type,
    super.key,
  });
  final int index;
  final String type;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
      builder: (controller) => InkWell(
        onTap: () => controller.updateOptionIndex(index),
        child: SizedBox(
          height: 120.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 85.w,
                height: 85.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: index == controller.selectedOptionIndex
                      ? Border.all(
                          color: AppColors.kPrimary,
                          width: 2.w,
                        )
                      : null,
                  image: DecorationImage(
                    image: FileImage(controller.selectedImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                type,
                style: AppTypography.BodyLBold.copyWith(
                  color: index == controller.selectedOptionIndex
                      ? AppColors.kPrimary
                      : theme.primaryTextColor,
                ),
              )
            ],
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
  }
}

class SaveResultsBottomSheet extends StatelessWidget {
  const SaveResultsBottomSheet({super.key});
  HomeViewController get controller => Get.find<HomeViewController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: theme.scaffoldColor,
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 550.h,
          width: Get.width,
          decoration: BoxDecoration(
            color: theme.scaffoldColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 8.h),
                  height: 3.h,
                  width: 38.w,
                  decoration: BoxDecoration(
                    color: AppColors.kGreyScale300,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Save Results',
                style: AppTypography.h4Bold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Divider(
                  height: 50.h,
                  color: AppColors.kGreyScale200,
                  thickness: 1,
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 16.h),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Get
                      ..back<void>()
                      ..dialog<Widget>(
                        const SavedToGalleryAlert(),
                      );
                  },
                  dense: true,
                  minVerticalPadding: 0,
                  contentPadding: EdgeInsets.symmetric(horizontal: 24.w),
                  title: Text(
                    controller.saveOptioons[index].resolution,
                    style: AppTypography.h5SemiBold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  trailing: controller.saveOptioons[index].isPro
                      ? ProBox()
                      : Icon(
                          IconlyLight.arrow_right_2,
                          color: theme.defaultIconColor,
                          size: 24.w,
                        ),
                ),
                separatorBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Divider(
                    height: 24.h,
                    color: theme.primaryDividerColor,
                    thickness: 1,
                  ),
                ),
                itemCount: controller.saveOptioons.length,
              ),
            ],
          ),
        );
      },
    );
  }
}

class SavedToGalleryAlert extends StatelessWidget {
  const SavedToGalleryAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      content: Container(
        width: 300.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: AppColors.kPrimary050,
          border: Border.all(
            color: AppColors.kAlertInfo,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_rounded,
              color: AppColors.kPrimary,
              size: 24.w,
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              'Saved to Gallery',
              style: AppTypography.h5Bold.copyWith(
                color: AppColors.kPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProBox extends StatelessWidget {
  const ProBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kPrimary,
        borderRadius: BorderRadius.circular(4.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Text(
        'PRO',
        style: AppTypography.BodySSemiBold.copyWith(
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
