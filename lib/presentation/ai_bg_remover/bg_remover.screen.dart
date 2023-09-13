import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/ai_bg_remover/bg_remove_result.dart';
import 'package:pixlify/presentation/ai_bg_remover/controllers/ai_bg_remover.controller.dart';
import 'package:pixlify/theme.dart';

class AiBgRemoverScreen extends StatelessWidget {
  const AiBgRemoverScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<AiBgRemoverController>(
      init: AiBgRemoverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            'AI Background Remover',
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
                height: 25.h,
              ),
              Text(
                'Upload a photo or image',
                style: AppTypography.h4Bold
                    .copyWith(color: theme.primaryTextColor),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Upload a photo or image, and we’ll remove the background for you.',
                style: AppTypography.BodyXlRegular.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              if (controller.image == null)
                InkWell(
                  onTap: () {
                    Get.dialog<Widget>(const ImagePickerDialogBgRemove());
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
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: 573.h,
                      maxWidth: Get.width,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          child: Image.file(
                            controller.image!,
                            fit: BoxFit.cover,
                            height: 573.h,
                            width: Get.width,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(18.0.w),
                            child: InkWell(
                              onTap: () {
                                Get.dialog<Widget>(
                                  const ImagePickerDialogBgRemove(),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(6.w),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.kPrimary,
                                ),
                                child: SvgPicture.asset(
                                  Images.replaceIcon,
                                  color: AppColors.kWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
          child: Center(
            child: RoundedButton(
              onTap: () {
                if (controller.image != null) {
                  Get.to<Widget>(
                    BgRemoveResult.new,
                    transition: Transition.cupertino,
                  );
                }
              },
              label: 'Continue',
              color: controller.image != null
                  ? AppColors.kPrimary
                  : AppColors.kDisabledButton,
            ),
          ),
        ),
      ),
    );
  }
}

///Dialog to be displayed so user can select image from gallery or camera
class ImagePickerDialogBgRemove extends StatelessWidget {
  const ImagePickerDialogBgRemove({super.key});
  AiBgRemoverController get controller => Get.find<AiBgRemoverController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      backgroundColor: theme.dialogColor,
      surfaceTintColor: theme.dialogColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Image',
            style: AppTypography.h3Bold.copyWith(
              color: AppColors.kPrimary,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              height: 45.h,
              child: InkWell(
                splashColor: TransparentColors().kRed,
                onTap: () async {
                  await controller.addImageCamera();
                  Get.back<void>();
                },
                child: Row(
                  children: [
                    Text(
                      'Select from Camera',
                      style: AppTypography.BodyLBold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      IconlyBold.camera,
                      color: AppColors.kPrimary,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              height: 45.h,
              child: InkWell(
                splashColor: TransparentColors().kRed,
                onTap: () async {
                  await controller.addImageGallery();
                  Get.back<void>();
                },
                child: Row(
                  children: [
                    Text(
                      'Select from Gallery',
                      style: AppTypography.BodyLBold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      IconlyBold.image_2,
                      color: AppColors.kPrimary,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
