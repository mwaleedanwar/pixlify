import 'package:get/get.dart';

import 'package:pixlify/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/presentation/account/about_pixlify.dart';
import 'package:pixlify/presentation/account/language_screen.dart';
import 'package:pixlify/presentation/account/privacy_policy.dart';
import 'package:pixlify/presentation/account/security.dart';
import 'package:pixlify/presentation/account/social_media_screen.dart';
import 'package:pixlify/presentation/ai_avatar_generator/avatar_result_screen.dart';
import 'package:pixlify/presentation/ai_avatar_generator/loading_screen.dart';
import 'package:pixlify/presentation/personal_info/personal_info.screen.dart';
import 'package:pixlify/presentation/screens.dart';

/// Contains List of all pages in the app
class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.WALKTHROUGH,
      page: () => const WalkthroughScreen(),
      binding: WalkthroughControllerBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpScreen(),
      binding: SignUpControllerBinding(),
    ),
    GetPage(
      name: Routes.PERSONAL_INFO,
      page: () => const PersonalInfoScreen(),
      binding: PersonalInfoControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_WRAPPER,
      page: () => const AuthWrapperScreen(),
      binding: AuthWrapperControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME_VIEW,
      page: () => const HomeViewScreen(),
      binding: HomeViewControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_TOOLBOX,
      page: () => const AiToolboxScreen(),
      binding: AiToolboxControllerBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.LANDING_PAGE,
      page: () => const LandingPageScreen(),
      binding: LandingPageControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_MAGIC_ERASE,
      page: () => const AiMagicEraseScreen(),
      binding: AiMagicEraseControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_BG_REMOVER,
      page: () => const AiBgRemoverScreen(),
      binding: AiBgRemoverControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_PHOTO_RECOLOR,
      page: () => const AiPhotoGeneratorScreen(),
      binding: AiPhotoRecolorControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_OLD_PHOTO_RESTORE,
      page: () => const AiOldPhotoRestoreScreen(),
      binding: AiOldPhotoRestoreControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_OLD_PHOTO_RECOLOR,
      page: () => const AiOldPhotoRecolorScreen(),
      binding: AiOldPhotoRecolorControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_EXTEND_IMAGE,
      page: () => const AiExtendImageScreen(),
      binding: AiExtendImageControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_BATCH_ENAHNCE,
      page: () => const AiBatchEnhanceScreen(),
      binding: AiBatchEnhanceControllerBinding(),
    ),
    GetPage(
      name: Routes.UPGRADE_TO_PRO,
      page: () => const UpgadeToProScreen(),
      binding: UpgadeToProControllerBinding(),
    ),
    GetPage(
      name: Routes.PAYMENT_METHODS,
      page: () => const PaymentMethodsScreen(),
      binding: PaymentMethodsControllerBinding(),
    ),
    GetPage(
      name: Routes.SECURITY,
      page: () => const SecurityScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.LANGUAGE,
      page: () => const LanguageScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.SOCIAL_MEDIA,
      page: () => const SocialMediaScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.PRIVACY_POLICY,
      page: () => const PrivacyPolicyScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => const AboutPixlify(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_AVATAR_GENERATOR,
      page: () => const AiAvatarGeneratorScreen(),
      binding: AiAvatarGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_AVATAR_GENERATOR_LOADING,
      page: () => const AvatarLoadingScreen(),
      binding: AiAvatarGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_AVATAR_GENERATOR_RESULT,
      page: () => const AvatarResultScreen(),
      binding: AiAvatarGeneratorControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_PHOTO_GENERATOR,
      page: () => const AiPhotoGeneratorScreen(),
      binding: AiPhotoGeneratorControllerBinding(),
    ),
  ];
}
