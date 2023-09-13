import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pixlify/components/colors/app_colors.dart';

import 'package:pixlify/infrastructure/navigation/navigation.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/intial_binding.dart';
import 'package:pixlify/theme.dart';

void main() async {
  await Get.putAsync<ThemeService>(() async => ThemeService());
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Pixlify());
}

/// Root widget for the entire app
class Pixlify extends StatelessWidget {
  /// Constructor
  const Pixlify({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      useInheritedMediaQuery: true,
      builder: (context, _) => GetMaterialApp(
        title: 'Pixlify',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.kWhite,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.kWhite,
            surfaceTintColor: AppColors.kWhite,
            elevation: 0,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.kDark1,
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.kDark1,
            surfaceTintColor: AppColors.kDark1,
            elevation: 0,
          ),
        ),
        themeMode: Get.find<ThemeService>().isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: Routes.SPLASH,
        getPages: Nav.routes,
        initialBinding: InitialBindings(),
      ),
    );
  }
}
