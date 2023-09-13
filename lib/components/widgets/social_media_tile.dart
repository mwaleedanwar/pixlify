import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/theme.dart';

/// Tile version of the social media button. Contains only the icon.
class SocialMediaTile extends StatelessWidget {
  const SocialMediaTile({required this.onTap, required this.icon, super.key});
  final Widget icon;
  final void Function() onTap;

  ThemeService get theme => Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100.r),
      onTap: onTap,
      child: Container(
        width: 84.w,
        height: 56.w,
        decoration: BoxDecoration(
          color: theme.socialMediaLoginButtonColor,
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            color: theme.socialMediaLoginButtonBorderColor,
          ),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
