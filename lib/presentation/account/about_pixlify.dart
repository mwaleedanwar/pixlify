import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/theme.dart';

/// Shows the abour page with version number and other links
class AboutPixlify extends StatelessWidget {
  /// Constructor
  const AboutPixlify({super.key});

  ///Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back<void>(),
          icon: Icon(IconlyLight.arrow_left, color: theme.defaultIconColor),
        ),
        title: Text(
          'About Pixlify',
          style: AppTypography.h4Bold.copyWith(
            color: theme.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        children: [
          Center(
            child: SvgPicture.asset(
              Images.logo,
              height: 140.h,
              width: 140.w,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Center(
            child: Text(
              'Pixlify v4.6.77',
              style: AppTypography.h4Bold.copyWith(
                color: theme.primaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            height: 50.h,
            color: theme.primaryDividerColor,
            thickness: 1,
          ),
          const AboutTile(
            'Job Vacancy',
          ),
          const AboutTile(
            'Developer',
          ),
          const AboutTile(
            'Partner',
          ),
          const AboutTile(
            'Accessibility',
          ),
          const AboutTile(
            'Terms of Use',
          ),
          const AboutTile(
            'Feedback',
          ),
          const AboutTile(
            'Rate us',
          ),
          const AboutTile(
            'Visit Our Website',
          ),
          const AboutTile(
            'Follow us on Social Media',
          ),
        ],
      ),
    );
  }
}

/// List tile widget for the options on the about page.
/// Pass in a String title and and a VoidCallBack onTap
class AboutTile extends StatelessWidget {
  /// constructor
  const AboutTile(
    this.title, {
    this.onTap,
    super.key,
  });

  /// Title of the tile
  final String title;

  /// On tap function. Change type as needed
  final void Function()? onTap;

  ///Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      title: Text(
        title,
        style: AppTypography.h5SemiBold.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      trailing: Icon(
        IconlyLight.arrow_right_2,
        size: 24.w,
        color: theme.defaultIconColor,
      ),
    );
  }
}
