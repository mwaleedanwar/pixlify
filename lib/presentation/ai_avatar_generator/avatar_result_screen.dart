import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/ai_avatar_generator/avatar_result_full_screen.dart';
import 'package:pixlify/presentation/ai_avatar_generator/controllers/ai_avatar_generator.controller.dart';
import 'package:pixlify/theme.dart';

class AvatarResultScreen extends StatelessWidget {
  const AvatarResultScreen({super.key});
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
      body: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(bottom: 120.h, left: 24.w, right: 24.w),
        itemCount: controller.generatedImagesExamples.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.w,
          crossAxisSpacing: 16.w,
        ),
        itemBuilder: (context, index) => AvatarResultThumbnail(
          controller.generatedImagesExamples[index],
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
            RoundedButtonLite(onTap: () {}, label: 'Generate More'),
            RoundedButton(
              onTap: () {},
              label: 'Download All',
              color: AppColors.kPrimary,
              width: 180,
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarResultThumbnail extends StatelessWidget {
  final String image;
  const AvatarResultThumbnail(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to<Widget>(() => AvatarResultFullScreen(image)),
      child: Container(
        width: 183.w,
        height: 183.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Container(
          width: 24.w,
          height: 24.w,
          margin: EdgeInsets.only(bottom: 10.w, left: 10.w),
          decoration: const BoxDecoration(
            color: AppColors.kPrimary,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Icon(
            IconlyLight.arrow_down,
            color: AppColors.kWhite,
            size: 16.w,
          ),
        ),
      ),
    );
  }
}
