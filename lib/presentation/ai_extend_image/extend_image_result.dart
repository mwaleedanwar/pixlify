import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/ai_extend_image/controllers/ai_extend_image.controller.dart';
import 'package:pixlify/theme.dart';

class ExtendImageResult extends StatelessWidget {
  const ExtendImageResult({super.key});

  AiExtendImageController get controller => Get.find<AiExtendImageController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Extend Images',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: double.parse(controller.aspectHeight.text).h,
                      maxWidth: double.parse(controller.aspectWidth.text).w,
                    ),
                    child: Image.file(
                      controller.image!,
                      height: double.parse(controller.aspectHeight.text).h,
                      width: double.parse(controller.aspectWidth.text).w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Extended as',
                style: AppTypography.h4Bold
                    .copyWith(color: theme.primaryTextColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AspectRatioDisplayField(
                    px: double.parse(controller.aspectWidth.text),
                  ),
                  AspectRatioDisplayField(
                    px: double.parse(controller.aspectHeight.text),
                  ),
                ],
              )
            ],
          ),
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
            RoundedButtonLite(
              width: 180,
              onTap: () {
                Get.back<void>();
              },
              label: 'Re-generate',
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

class AspectRatioDisplayField extends StatelessWidget {
  final double px;
  const AspectRatioDisplayField({
    required this.px,
    super.key,
  });
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3,
      height: 45.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.kPrimary,
            width: 2.w,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            px.toString(),
            style: AppTypography.h5Bold.copyWith(color: theme.primaryTextColor),
          ),
          Text(
            'px',
            style: AppTypography.h5Bold.copyWith(color: theme.primaryTextColor),
          ),
        ],
      ),
    );
  }
}
