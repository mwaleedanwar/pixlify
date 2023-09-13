import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

/// Social media screen with relevant links
class SocialMediaScreen extends StatelessWidget {
  /// Constructor
  const SocialMediaScreen({super.key});

  /// Access account controller
  AccountController get controller => Get.find<AccountController>();

  /// Access theme service.
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
          'Follow us on Social Media',
          style: AppTypography.h4Bold.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
        shrinkWrap: true,
        itemBuilder: (context, index) => SocialMediaTile(
          name: controller.socialMedias[index].title,
          image: controller.socialMedias[index].icon,
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 24.h,
        ),
        itemCount: controller.socialMedias.length,
      ),
    );
  }
}

/// Social media list tile
/// contains social media name and icon
/// icon is a String of the path to the svg icon
class SocialMediaTile extends StatelessWidget {
  /// Constructor
  const SocialMediaTile({
    required this.name,
    required this.image,
    this.onTap,
    super.key,
  });

  /// Relevant social media name
  final String name;

  /// Path to social media svg icon
  final String image;

  /// On tap function
  final void Function()? onTap;

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.socialMediaLoginButtonColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.socialMediaLoginButtonColor,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: 12.w,
            ),
            Text(name,
                style: AppTypography.BodyLBold.copyWith(
                  color: theme.primaryTextColor,
                )),
            const Spacer(),
            Icon(
              IconlyLight.arrow_right_2,
              color: theme.defaultIconColor,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
