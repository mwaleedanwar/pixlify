import 'dart:ui';
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
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';
import 'package:pixlify/theme.dart';

/// Main account screen displayed in the account tab.
class AccountScreen extends GetView<AccountController> {
  /// Constructor
  const AccountScreen({super.key});

  /// Put controller in memory
  AccountController get controller => Get.put(AccountController());

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 50.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: SizedBox(
              height: 28.w,
              width: 28.w,
              child: SvgPicture.asset(Images.logo),
            ),
          ),
          title: Text(
            'Account',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 30.w,
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),
                  title: Text(
                    'John Doe',
                    style: AppTypography.h6Bold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  subtitle: Text(
                    'firstname.lastname@yourdomain.com',
                    style: AppTypography.BodyMMedium.copyWith(
                      color: theme.subtextColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const UpgradeToProBanner(),
                SizedBox(
                  height: 20.h,
                ),
                const SubsectionDivider(subtitle: 'General'),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.generalSettings.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      SettingTile(item: controller.generalSettings[index]),
                ),
                DarkModeTile(),
                SubsectionDivider(subtitle: 'About'),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.aboutSettings.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      SettingTile(item: controller.aboutSettings[index]),
                ),
                LogOutTile(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Stateless banner to advertise pro membership.
class UpgradeToProBanner extends StatelessWidget {
  /// constructor
  const UpgradeToProBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () => Get.toNamed(Routes.UPGRADE_TO_PRO),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: Gradients.kRed,
        ),
        padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 16.w),
        child: Row(
          children: [
            SvgPicture.asset(Images.upgradeToPro),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Upgrade to PRO',
                  style: AppTypography.h4Bold.copyWith(color: AppColors.kWhite),
                ),
                SizedBox(
                  height: 4.h,
                ),
                SizedBox(
                  width: 200.w,
                  child: Text(
                    'Enjoy all features & benefits without any restrictions',
                    maxLines: 2,
                    style: AppTypography.BodyMMedium.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ],
            ),
            Icon(
              IconlyLight.arrow_right_2,
              color: AppColors.kWhite,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}

/// Subsection divider with a subtitle and a divider separated by 16px.
class SubsectionDivider extends StatelessWidget {
  /// Constructor
  const SubsectionDivider({
    required this.subtitle,
    super.key,
  });

  /// subtitle
  final String subtitle;

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          subtitle,
          style: AppTypography.BodyMSemiBold.copyWith(
            color: AppColors.kGreyScale500,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Divider(
            color: theme.primaryDividerColor,
            thickness: 1.w,
          ),
        ),
      ],
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.item,
    super.key,
  });
  final AccountMenuItem item;
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(item.path),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: Icon(
        item.icon,
        color: theme.defaultIconColor,
        size: 24.w,
      ),
      title: Text(
        item.title,
        style: AppTypography.h6Bold.copyWith(
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

/// List tile to control the dark mode option of the app
class DarkModeTile extends StatelessWidget {
  /// constructor
  const DarkModeTile({super.key});

  /// Access account service
  AccountController get controller => Get.find<AccountController>();

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: Icon(
          IconlyLight.show,
          color: theme.defaultIconColor,
          size: 24.w,
        ),
        title: Text(
          'Dark Mode',
          style: AppTypography.h6Bold.copyWith(color: theme.primaryTextColor),
        ),
        trailing: Switch(
          value: theme.isDarkMode,
          onChanged: (checked) {
            theme.changeTheme();
          },
          activeColor: AppColors.kPrimary,
          inactiveTrackColor: AppColors.kGreyScale300,
          inactiveThumbColor: AppColors.kWhite,
          trackOutlineColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
        ),
      ),
    );
  }
}

/// List tile to log out from the app. Opens a confirmation bottom sheet.
class LogOutTile extends StatelessWidget {
  /// constructor
  const LogOutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showModalBottomSheet<Widget>(
        context: context,
        barrierColor: AppColors.kBlueBlack.withOpacity(0.6),
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: const LogoutBottomSheet(),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      minVerticalPadding: 0,
      leading: Icon(
        IconlyLight.logout,
        color: AppColors.kAlertError,
        size: 24.w,
      ),
      title: Text(
        'Logout',
        style: AppTypography.h6Bold.copyWith(
          color: AppColors.kPrimary,
        ),
      ),
    );
  }
}

/// Bottom sheet that confirms logout action
class LogoutBottomSheet extends StatelessWidget {
  /// constructor
  const LogoutBottomSheet({super.key});

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: AppColors.kWhite,
      onClosing: () {},
      builder: (context) {
        return Container(
          height: 275.h,
          width: Get.width,
          decoration: BoxDecoration(
            color: theme.dialogColor,
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
                'Logout',
                style: AppTypography.h4Bold.copyWith(
                  color: AppColors.kAlertError,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Divider(
                  height: 50.h,
                  color: theme.primaryDividerColor,
                  thickness: 1,
                ),
              ),
              Text(
                'Are you sure you want to logout?',
                style: AppTypography.h5Bold
                    .copyWith(color: theme.primaryTextColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButtonLite(
                    width: 180,
                    onTap: () => Get.back<void>(),
                    label: 'Cancel',
                  ),
                  RoundedButton(
                    width: 180,
                    onTap: () {
                      Get.back<void>();
                      Get.find<AuthWrapperController>().signOut();
                    },
                    label: 'Yes, Logout',
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
