import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/rounded_button_lite.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

/// Security options screen
class SecurityScreen extends StatelessWidget {
  /// Constructor
  const SecurityScreen({super.key});

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<AccountController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back<void>(),
            icon: Icon(
              IconlyLight.arrow_left,
              color: theme.defaultIconColor,
            ),
          ),
          title: Text(
            'Security',
            style: AppTypography.h4Bold.copyWith(
              color: theme.primaryTextColor,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            SizedBox(
              height: 20.h,
            ),
            SecurityOptionTile(
              title: 'Remember me',
              value: controller.rememberMe,
              onChanged: (bool checked) {
                controller.rememberMe = checked;
              },
            ),
            SecurityOptionTile(
              title: 'Biometric ID',
              value: controller.bioMetricId,
              onChanged: (bool checked) {
                controller.bioMetricId = checked;
              },
            ),
            SecurityOptionTile(
              title: 'Face ID',
              value: controller.faceId,
              onChanged: (bool checked) {
                controller.faceId = checked;
              },
            ),
            SecurityOptionTile(
              title: 'SMS Authenticator',
              value: controller.smsAuth,
              onChanged: (bool checked) {
                controller.smsAuth = checked;
              },
            ),
            SecurityOptionTile(
              title: 'Google Authenticator',
              value: controller.googleAuth,
              onChanged: (bool checked) {
                controller.googleAuth = checked;
              },
            ),
            ListTile(
              title: Text(
                'Device Management',
                style: AppTypography.h5SemiBold.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
              trailing: Icon(
                IconlyLight.arrow_right_2,
                color: theme.defaultIconColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            RoundedButtonLite(
              onTap: () {},
              label: 'Change Password',
            ),
          ],
        ),
      ),
    );
  }
}

/// Security option tile
class SecurityOptionTile extends StatelessWidget {
  /// Constructor
  const SecurityOptionTile({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
  });

  /// Security option name.
  final String title;

  /// Current value of the switch (assign from controller)
  final bool value;

  /// On change callback
  final void Function(bool)? onChanged;

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Face ID',
        style: AppTypography.h5SemiBold.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.kPrimary,
        inactiveTrackColor: AppColors.kGreyScale300,
        inactiveThumbColor: AppColors.kWhite,
        trackOutlineColor: const MaterialStatePropertyAll(
          Colors.transparent,
        ),
      ),
    );
  }
}
