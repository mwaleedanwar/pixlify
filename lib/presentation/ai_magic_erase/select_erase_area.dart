import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/presentation/ai_bg_remover/bg_remove_result.dart';
import 'package:pixlify/presentation/ai_magic_erase/controllers/ai_magic_erase.controller.dart';
import 'package:pixlify/theme.dart';

/// Select area from image to be removed.
class SelectEraseArea extends StatefulWidget {
  const SelectEraseArea({super.key});

  @override
  State<SelectEraseArea> createState() => _SelectEraseAreaState();
}

class _SelectEraseAreaState extends State<SelectEraseArea> {
  final AiMagicEraseController controller = Get.find<AiMagicEraseController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AI Magic Eraser Photo',
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
              height: 25.h,
            ),
            Text(
              'Erase unwanted part or object',
              style: AppTypography.h4Bold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Mark the part of the unwanted object that you want to remove. We’ll erase it for you.',
              style: AppTypography.BodyXlRegular.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: 550.h,
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
        color: theme.scaffoldColor,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: RoundedButton(
            onTap: () {
              Get.to<Widget>(BgRemoveResult.new);
            },
            label: 'Erase',
            color: AppColors.kPrimary,
          ),
        ),
      ),
    );
  }
}
