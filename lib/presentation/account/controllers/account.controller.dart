import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/components/images/images.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';

class AccountController extends GetxController {
  
  bool get rememberMe => _rememberMe.value;
  bool get bioMetricId => _bioMetricId.value;
  bool get faceId => _faceId.value;
  bool get smsAuth => _smsAuth.value;
  bool get googleAuth => _googleAuth.value;

  set rememberMe(bool value) => _rememberMe.value = value;
  set bioMetricId(bool value) => _bioMetricId.value = value;
  set faceId(bool value) => _faceId.value = value;
  set smsAuth(bool value) => _smsAuth.value = value;
  set googleAuth(bool value) => _googleAuth.value = value;

  RxBool _rememberMe = false.obs;
  RxBool _bioMetricId = false.obs;
  RxBool _faceId = false.obs;
  RxBool _smsAuth = false.obs;
  RxBool _googleAuth = false.obs;

  set currentLanguage(String value) => _currentLanguage.value = value;
  String get currentLanguage => _currentLanguage.value;
  RxString _currentLanguage = 'English (UK)'.obs;
  final languages = <String>[
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Portuguese',
    'Hindi',
    'Arabic',
    'Japanese',
    'Russian',
    'Korean',
    'Italian',
    'Turkish',
    'Thai',
    'Dutch',
    'Indonesian',
    'Greek',
    'Polish',
    'Swedish',
    'Danish',
    'Finnish',
    'Norwegian',
    'Hungarian',
    'Czech',
    'Romanian',
    'Hebrew',
    'Vietnamese',
    'Ukrainian',
    'Croatian',
  ];
  final recommendedLanguages = <String>['English (UK)', 'English (US)'];

  final socialMedias = <SocialMediaItem>[
    SocialMediaItem(
      title: 'Twitter',
      icon: Images.twitterLogo,
    ),
    SocialMediaItem(
      title: 'Instagram',
      icon: Images.instagramLogo,
    ),
    SocialMediaItem(
      title: 'Discrd',
      icon: Images.discordLogo,
    ),
    SocialMediaItem(
      title: 'Reddit',
      icon: Images.redditLogo,
    ),
    SocialMediaItem(
      title: 'Telegram',
      icon: Images.telegramLogo,
    ),
    SocialMediaItem(
      title: 'YouTube',
      icon: Images.youtubeLogo,
    ),
  ];

  final par1 =
      'At Pixlify, we respect and protect the privacy of our users. This Privacy Policy outlines the types of personal information we collect, how we use it, and how we protect your information.';
  final par2 =
      '''When you use our app, we may collect the following types of personal information:
 • Device Information: We may collect information about the type of device you use, its operating system, and other technical details to help us improve our app.
 • Usage Information: We may collect information about how you use our app, such as which features you use and how often you use them.
 • Personal Information: We may collect personal information, such as your name, email address, or phone number, if you choose to provide it to us.
''';
  final par3 = '''We use your information for the following purposes:
 • To provide and improve our app: We use your information to provide and improve our app, including to personalize your experience and to analyze how our app is used.
 • To communicate with you: We may use your information to communicate with you about our app, including to provide you with updates and news about our app.
 • To protect our rights and the rights of others: We may use your information to protect our rights and the rights of others, such as to investigate and prevent fraud or other illegal activity.''';

  // TODO: ADD PATHS
  final generalSettings = <AccountMenuItem>[
    AccountMenuItem(
      title: 'Personal Info',
      icon: IconlyLight.profile,
      path: Routes.PERSONAL_INFO,
    ),
    AccountMenuItem(
      title: 'Payment Methods',
      icon: CupertinoIcons.creditcard,
      path: Routes.PAYMENT_METHODS,
    ),
    AccountMenuItem(
      title: 'Security',
      icon: IconlyLight.shield_done,
      path: Routes.SECURITY,
    ),
    AccountMenuItem(
      title: 'Language',
      icon: IconlyLight.document,
      path: Routes.LANGUAGE,
    ),
  ];
  final aboutSettings = <AccountMenuItem>[
    AccountMenuItem(
      title: 'Follow us on Social Media',
      icon: IconlyLight.paper,
      path: Routes.SOCIAL_MEDIA,
    ),
    AccountMenuItem(
      title: 'Privacy Policy',
      icon: IconlyLight.lock,
      path: Routes.PRIVACY_POLICY,
    ),
    AccountMenuItem(
      title: 'About Pixlify',
      icon: IconlyLight.info_square,
      path: Routes.ABOUT,
    ),
  ];

  bool get darkMode => _darkMode.value;
  set darkMode(bool value) => _darkMode.value = value;
  RxBool _darkMode = false.obs;
}

class AccountMenuItem {
  final String title;
  final IconData icon;
  final String path;

  AccountMenuItem({
    required this.title,
    required this.icon,
    required this.path,
  });
}

class SocialMediaItem {
  final String title;
  final String icon;
  final String? path;

  SocialMediaItem({
    required this.title,
    required this.icon,
    this.path,
  });
}
