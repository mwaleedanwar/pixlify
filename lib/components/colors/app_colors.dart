import 'package:flutter/material.dart';

/// Contains all the colors used in the app
class AppColors {
  static const kPrimary = Color(0xFFFF4A4A);
  static const kPrimary800 = Color(0xFFFF5C5C);
  static const kPrimary700 = Color(0xFFFF6E6E);
  static const kPrimary600 = Color(0xFFFF8080);
  static const kPrimary500 = Color(0xFFFF9292);
  static const kPrimary400 = Color(0xFFFFA5A5);
  static const kPrimary300 = Color(0xFFFFB7B7);
  static const kPrimary200 = Color(0xFFFFC9C9);
  static const kPrimary100 = Color(0xFFFFDBDB);
  static const kPrimary050 = Color(0xFFFFEDED);
  static const kSecondary = Color(0xFFDC3535);
  static const kSecondary800 = Color(0xFFE04949);
  static const kSecondary700 = Color(0xFFE35D5D);
  static const kSecondary600 = Color(0xFFE77272);
  static const kSecondary500 = Color(0xFFEA8686);
  static const kSecondary400 = Color(0xFFEE9A9A);
  static const kSecondary300 = Color(0xFFF1AEAE);
  static const kSecondary200 = Color(0xFFF5C2C2);
  static const kSecondary100 = Color(0xFFF8D7D7);
  static const kSecondary050 = Color(0xFFFCEBEB);
  static const kAlertInfo = Color(0xFFFF4A4A);
  static const kAlertSuccess = Color(0xFF12D18E);
  static const kAlertWarning = Color(0xFFFACC15);
  static const kAlertError = Color(0xFFF75555);
  static const kLightDisabled = Color(0xFFD8D8D8);
  static const kDarkDisabled = Color(0xFF23252B);
  static const kDisabledButton = Color(0xFFCC3B3B);
  static const kGreyScale900 = Color(0xFF212121);
  static const kGreyScale800 = Color(0xFF424242);
  static const kGreyScale700 = Color(0xFF616161);
  static const kGreyScale600 = Color(0xFF757575);
  static const kGreyScale500 = Color(0xFF9E9E9E);
  static const kGreyScale400 = Color(0xFFBDBDBD);
  static const kGreyScale300 = Color(0xFFE0E0E0);
  static const kGreyScale200 = Color(0xFFEEEEEE);
  static const kGreyScale100 = Color(0xFFF5F5F5);
  static const kGreyScale050 = Color(0xFFFAFAFA);
  static const kDark1 = Color(0xFF181A20);
  static const kDark2 = Color(0xFF1E2025);
  static const kDark3 = Color(0xFF1F222A);
  static const kDark4 = Color(0xFF262A35);
  static const kDark5 = Color(0xFF35383F);
  static const kWhite = Color(0xFFFFFFFF);
  static const kBlack = Color(0xFF000000);
  static const kRed = Color(0xFFF44336);
  static const kPink = Color(0xFFE91E63);
  static const kPurple = Color(0xFF9C27B0);
  static const kDeepPurple = Color(0xFF673AB7);
  static const kIndigo = Color(0xFF3F51B5);
  static const kBlue = Color(0xFF2196F3);
  static const kLightBlue = Color(0xFF03A9F4);
  static const kCyan = Color(0xFF00BCD4);
  static const kTeal = Color(0xFF009688);
  static const kGreen = Color(0xFF4CAF50);
  static const kLightGreen = Color(0xFF8BC34A);
  static const kLime = Color(0xFFCDDC39);
  static const kYellow = Color(0xFFFFEB3B);
  static const kAmber = Color(0xFFFFC107);
  static const kOrange = Color(0xFFFF9800);
  static const kDeepOrange = Color(0xFFFF5722);
  static const kBrown = Color(0xFF795548);
  static const kGrey = Color(0xFF9E9E9E);
  static const kBlueBlack = Color(0xFF09101D);
}

/// Contains all the background colors used in the app
class BackgroundColors {
  static const kRed = Color(0xFFFFF3F3);
  static const kPink = Color(0xFFF5F3FF);
  static const kBlue = Color(0xFFF3F6FF);
  static const kGreen = Color(0xFFEDFBF7);
  static const KTeal = Color(0xFFEFF9F8);
  static const kYellow = Color(0xFFFFFCEB);
  static const kOrange = Color(0xFFFFF8EE);
}

/// Contains all the transparent colors used in the app
class TransparentColors {
  final kRed = const Color(0xFFFF4A4A).withOpacity(0.08);
  final kPurple = const Color(0xFF6949FF).withOpacity(0.08);
  final kBlue = const Color(0xFF4B68FF).withOpacity(0.08);
  final kGreen = const Color(0xFF17CE92).withOpacity(0.08);
  final KTeal = const Color(0xFF009B8D).withOpacity(0.08);
  final kBrown = const Color(0xFFA4634D).withOpacity(0.08);
  final kYellow = const Color(0xFFFFD300).withOpacity(0.08);
  final kOrange = const Color(0xFFF89300).withOpacity(0.08);
}

/// Contains all the linear gradients used in the app
class Gradients {
  static const kRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF4A4A),
      Color(0xFFFF6E6E),
    ],
  );
  static const kPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF6949FF),
      Color(0xFF876DFF),
    ],
  );
  static const kBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF235DFF),
      Color(0xFF235DFF),
    ],
  );
  static const kGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF17CE92),
      Color(0xFF2CEAAB),
    ],
  );
  static const KTeal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF009B8D),
      Color(0xFF32D0C2),
    ],
  );
  static const kBrown = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA4634D),
      Color(0xFFAC7E6E),
    ],
  );
  static const kYellow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFACC15),
      Color(0xFFFFE580),
    ],
  );
  static const kOrange = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFF89300),
      Color(0xFFFFBB58),
    ],
  );
}
