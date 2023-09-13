import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/presentation/account/controllers/account.controller.dart';
import 'package:pixlify/theme.dart';

/// Change language screen
class LanguageScreen extends StatelessWidget {
  /// Constructor
  const LanguageScreen({super.key});

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
            Text(
              'Suggested',
              style: AppTypography.h5SemiBold.copyWith(
                color: theme.primaryTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ...List.generate(
              controller.recommendedLanguages.length,
              (index) => LanguageListTile(
                language: controller.recommendedLanguages[index],
                isCurrent: controller.recommendedLanguages[index] ==
                    controller.currentLanguage,
              ),
            ),
            Divider(
              height: 56.h,
              color: theme.primaryDividerColor,
            ),
            Text(
              'Suggested',
              style: AppTypography.h5SemiBold.copyWith(
                color: theme.hintTextColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ...List.generate(
              controller.languages.length,
              (index) => LanguageListTile(
                language: controller.languages[index],
                isCurrent:
                    controller.languages[index] == controller.currentLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// List Tile to choose and display current app language
class LanguageListTile extends StatelessWidget {
  /// Constructor
  const LanguageListTile({
    required this.language,
    required this.isCurrent,
    super.key,
  });

  /// language name
  final String language;

  /// <bool> is current language. If true displays a tick at the end
  final bool isCurrent;

  /// Access account controller
  AccountController get controller => Get.find<AccountController>();

  /// Access theme service
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => controller.currentLanguage = language,
      title: Text(
        language,
        style: AppTypography.h5SemiBold.copyWith(
          color: theme.primaryTextColor,
        ),
      ),
      trailing: isCurrent
          ? const Icon(
              Icons.check_rounded,
              color: AppColors.kPrimary,
            )
          : null,
    );
  }
}
