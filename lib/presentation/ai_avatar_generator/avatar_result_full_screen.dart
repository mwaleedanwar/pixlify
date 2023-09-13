import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/theme.dart';

class AvatarResultFullScreen extends StatelessWidget {
  const AvatarResultFullScreen(this.image, {super.key});
  final String image;
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
      ),
      body: Center(
        heightFactor: 1.75,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 24.w,
          ),
          width: 400.h,
          height: 400.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
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
              onTap: () {
                Get.bottomSheet<Widget>(
                  const ShareBottomSheet(),
                );
              },
              label: 'Share',
            ),
            RoundedButton(
              onTap: () {},
              label: 'Download',
              color: AppColors.kPrimary,
              width: 180,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  ThemeService get theme => Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: theme.scaffoldColor,
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 360.h,
          width: Get.width,
          decoration: BoxDecoration(
            color: theme.scaffoldColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
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
                'Share',
                style: AppTypography.h4Bold
                    .copyWith(color: theme.primaryTextColor),
              ),
              Divider(
                height: 50.h,
                color: theme.primaryDividerColor,
                thickness: 1,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShareItem(
                    image: Images.whatsappShareIcon,
                    label: 'Whatsapp',
                  ),
                  ShareItem(
                    image: Images.twitterShareIcon,
                    label: 'Twitter',
                  ),
                  ShareItem(
                    image: Images.facebookShareIcon,
                    label: 'Facebook',
                  ),
                  ShareItem(
                    image: Images.instagramShareIcon,
                    label: 'Instagram',
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShareItem(
                    image: Images.telegramShareIcon,
                    label: 'Telegram',
                  ),
                  ShareItem(
                    image: Images.yahooShareIcon,
                    label: 'Yahoo',
                  ),
                  ShareItem(
                    image: Images.chatShareIcon,
                    label: 'Chat',
                  ),
                  ShareItem(
                    image: Images.wechatShareIcon,
                    label: 'WeChat',
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

class ShareItem extends StatelessWidget {
  const ShareItem({required this.image, required this.label, super.key});
  final String image;
  final String label;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 90.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            width: 60.w,
            height: 60.h,
            fit: BoxFit.contain,
          ),
          Text(
            label,
            style: AppTypography.BodyMMedium.copyWith(
                color: theme.primaryTextColor),
          )
        ],
      ),
    );
  }
}
