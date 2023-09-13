import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

class ThemeService extends GetxService {
  bool get isDarkMode => _isDarkMode.value;
  final _isDarkMode = false.obs;

  void changeTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _isDarkMode.refresh();
  }

  Color get scaffoldColor => isDarkMode ? AppColors.kDark1 : AppColors.kWhite;
  Color get primaryTextColor =>
      isDarkMode ? AppColors.kWhite : AppColors.kGreyScale900;
  Color get subtextColor =>
      isDarkMode ? AppColors.kGreyScale300 : AppColors.kGreyScale700;
  Color get defaultIconColor =>
      isDarkMode ? AppColors.kWhite : AppColors.kGreyScale900;
  Color get pageTabColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale300;
  Color get hintTextColor =>
      isDarkMode ? AppColors.kGreyScale700 : AppColors.kGreyScale400;
  Color get textBoxUnfocusedBorderColor =>
      isDarkMode ? AppColors.kGreyScale800 : AppColors.kGreyScale500;
  Color get socialMediaLoginButtonColor =>
      isDarkMode ? AppColors.kDark3 : AppColors.kWhite;
  Color get socialMediaLoginButtonBorderColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale200;
  Color get roundButtonLiteColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kPrimary050;
  Color get roundButtonLiteTextColor =>
      isDarkMode ? AppColors.kWhite : AppColors.kPrimary;
  Color get emptyAvatarBackGroundColor =>
      isDarkMode ? AppColors.kGreyScale500 : AppColors.kGreyScale100;
  Color get emptyAvatarIconColor =>
      isDarkMode ? AppColors.kGreyScale800 : AppColors.kGreyScale500;
  Color get bottomSheetColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kWhite;
  Color get bottomSheetDividerColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale200;
  Color get bottomSheetBorderColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale100;
  Color get primaryDividerColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale200;
  Color get tileBackgroundColor =>
      isDarkMode ? AppColors.kDark5 : AppColors.kGreyScale050;
  Color get tileBorderColor =>
      isDarkMode ? AppColors.kDark3 : AppColors.kGreyScale200;
  Color get dialogColor => isDarkMode ? AppColors.kDark3 : AppColors.kWhite;
  Color get navigationBarBackgroundColor =>
      isDarkMode ? AppColors.kDark1 : AppColors.kWhite;
  LinearGradient get imageFadeMask => isDarkMode
      ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kDark5.withOpacity(0),
            AppColors.kDark5.withOpacity(0.5),
            AppColors.kDark5.withOpacity(0.8),
            AppColors.kDark5.withOpacity(0.9),
            AppColors.kDark5,
          ],
          stops: const <double>[
            0,
            0.4219,
            0.6198,
            0.8073,
            1,
          ],
        )
      : LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.kWhite.withOpacity(0),
            AppColors.kWhite.withOpacity(0.5),
            AppColors.kWhite.withOpacity(0.8),
            AppColors.kWhite.withOpacity(0.9),
            AppColors.kWhite,
          ],
          stops: const <double>[
            0,
            0.4219,
            0.6198,
            0.8073,
            1,
          ],
        );
}
