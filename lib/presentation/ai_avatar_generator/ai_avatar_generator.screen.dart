import 'dart:io';

import 'package:flutter/cupertino.dart' as cp;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_icon_with_button.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';

import 'package:pixlify/presentation/ai_avatar_generator/controllers/ai_avatar_generator.controller.dart';
import 'package:pixlify/theme.dart';

class AiAvatarGeneratorScreen extends StatelessWidget {
  const AiAvatarGeneratorScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<AiAvatarGeneratorController>(
      init: AiAvatarGeneratorController(),
      builder: (controller) {
        if (controller.selectedImages.isEmpty) {
          return const AiAvatarGeneratorTutorialScreen();
        }
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back<void>(),
              icon: Icon(
                IconlyLight.arrow_left,
                color: theme.defaultIconColor,
              ),
            ),
            title: Text(
              'AI Avatar Generator',
              style:
                  AppTypography.h4Bold.copyWith(color: theme.primaryTextColor),
            ),
            centerTitle: true,
          ),
          body: Padding(
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
                          '${controller.selectedImages.length} photos have been uploaded',
                          style: AppTypography.h4Bold
                              .copyWith(color: theme.primaryTextColor),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '${controller.selectedImages.length} photos have been uploaded and are ready to be enhanced at once.',
                          style: AppTypography.BodyXlRegular.copyWith(
                            color: theme.primaryTextColor,
                          ),
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
                itemCount: controller.selectedImages.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.w,
                  crossAxisSpacing: 16.w,
                ),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const UploadMoreTileAvatarGenerator();
                  }
                  return BatchEnhancePreviewThumbnailAvatarGenerator(
                    image: controller.selectedImages[index - 1],
                    index: index - 1,
                  );
                },
              ),
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
                  Get.toNamed(Routes.AI_AVATAR_GENERATOR_LOADING);
                },
                label: 'Generate',
                color: AppColors.kPrimary,
              ),
            ),
          ),
        );
      },
    );
  }
}

class UploadMoreTileAvatarGenerator extends StatelessWidget {
  const UploadMoreTileAvatarGenerator({super.key});
  AiAvatarGeneratorController get controller =>
      Get.find<AiAvatarGeneratorController>();
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
          controller.pickImages();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_rounded,
              color: AppColors.kPrimary,
              size: 44.w,
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

class BatchEnhancePreviewThumbnailAvatarGenerator extends StatelessWidget {
  final File image;
  final int index;
  const BatchEnhancePreviewThumbnailAvatarGenerator({
    required this.image,
    required this.index,
    super.key,
  });
  AiAvatarGeneratorController get controller =>
      Get.find<AiAvatarGeneratorController>();
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
            width: 16.w,
            height: 16.w,
            color: AppColors.kWhite,
          ),
        ),
      ),
    );
  }
}

class ExampleImageThumbnail extends StatelessWidget {
  final String image;
  const ExampleImageThumbnail(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.w,
      width: 100.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AiAvatarGeneratorTutorialScreen extends StatelessWidget {
  const AiAvatarGeneratorTutorialScreen({super.key});

  AiAvatarGeneratorController get controller =>
      Get.find<AiAvatarGeneratorController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: Icon(
            IconlyLight.arrow_left,
            color: theme.defaultIconColor,
          ),
        ),
        title: Text(
          'AI Avatar Generator',
          style: AppTypography.h4Bold.copyWith(color: theme.primaryTextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick 5 - 10 photos of yourself',
                style: AppTypography.h4Bold
                    .copyWith(color: theme.primaryTextColor),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(
                    IconlyBold.tick_square,
                    size: 24.w,
                    color: AppColors.kAlertSuccess,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Good Photos',
                    style: AppTypography.h6SemiBold
                        .copyWith(color: theme.primaryTextColor),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  'Close-up selfies, one and same person, variety of expressions and face angles.',
                  style: AppTypography.BodyXlMedium.copyWith(
                      color: theme.primaryTextColor),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 110.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.goodImageExamples.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemBuilder: (context, index) => ExampleImageThumbnail(
                    controller.goodImageExamples[index],
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Icon(
                    IconlyBold.close_square,
                    size: 24.w,
                    color: AppColors.kAlertError,
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text(
                    'Bad Photos',
                    style: AppTypography.h6SemiBold
                        .copyWith(color: theme.primaryTextColor),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: Text(
                  'Group pics and different person, face not visible, wearing glasses, animals.',
                  style: AppTypography.BodyXlMedium.copyWith(
                      color: theme.primaryTextColor),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 110.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.badImageExamples.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 16.w,
                  ),
                  itemBuilder: (context, index) => ExampleImageThumbnail(
                    controller.badImageExamples[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: Get.width,
        height: 120.h,
        color: theme.scaffoldColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: RoundedButtonWithIcon(
            onTap: () => controller.pickImages(),
            label: 'Upload 5 - 10 Photos',
            icon: IconlyLight.upload,
          ),
        ),
      ),
    );
  }
}
