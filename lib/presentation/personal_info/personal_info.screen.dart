import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pixlify/components/colors/app_colors.dart';
import 'package:pixlify/components/typography/app_typography.dart';
import 'package:pixlify/components/widgets/alert_button.dart';
import 'package:pixlify/components/widgets/skinny_text_form_field.dart';
import 'package:pixlify/presentation/auth_wrapper/controllers/auth_wrapper.controller.dart';

import 'package:pixlify/presentation/personal_info/controllers/personal_info.controller.dart';
import 'package:iconly/iconly.dart';
import 'package:pixlify/presentation/personal_info/sign_up_sucess.dart';
import 'package:pixlify/theme.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<PersonalInfoController>(
      init: PersonalInfoController(),
      initState: (_) {},
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: 24.w,
                right: 24.w,
                top: MediaQuery.of(context).padding.top,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 21.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back<void>();
                    },
                    child: Icon(
                      IconlyLight.arrow_left,
                      size: 28.w,
                    ),
                  ),
                  SizedBox(
                    height: 34.h,
                  ),
                  Text(
                    'Enter personal info 📋',
                    style: AppTypography.h3Bold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  Text(
                    "Please enter your profile. Don't worry, only you can see your personal data. No one else will be able to see it. Or you can skip it for now.",
                    style: AppTypography.BodyXlRegular.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Center(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        await Get.dialog<Widget>(
                          const ImagePickerDialog(),
                        );
                      },
                      child: SizedBox(
                        height: 120.h,
                        width: 118.w,
                        child: Stack(
                          children: [
                            Align(
                              child: CircleAvatar(
                                radius: 60.r,
                                backgroundImage: controller.image == null
                                    ? null
                                    : FileImage(controller.image!),
                                backgroundColor:
                                    theme.emptyAvatarBackGroundColor,
                                child: ClipOval(
                                  child: Transform.translate(
                                    offset: Offset(-12.w, 0),
                                    child: Icon(
                                      Icons.person_rounded,
                                      color: theme.emptyAvatarIconColor,
                                      size: 140.w,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomRight,
                              child: Icon(
                                IconlyBold.editSquare,
                                color: AppColors.kPrimary,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Full name',
                    style: AppTypography.BodyLBold,
                  ),
                  SkinnyTextFormField(
                    controller: controller.name,
                    hintText: 'Full name',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Phone Number',
                    style: AppTypography.BodyLBold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  SkinnyTextFormField(
                    prefixIcon: CountryCodePicker(
                      onChanged: (code) {
                        controller.updateCountryCode(code.dialCode);
                      },
                      initialSelection: 'US',
                      favorite: const ['+1', 'US'],
                      alignLeft: true,
                      builder: (code) {
                        return SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: Row(
                            children: [
                              Image.asset(
                                code!.flagUri!,
                                package: 'country_code_picker',
                                width: 22.w,
                                height: 22.h,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Icon(
                                IconlyLight.arrow_down_2,
                                color: theme.defaultIconColor,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    controller: controller.number,
                    hintText: '${controller.countryCode} 000 000 000',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Date of Birth',
                    style: AppTypography.BodyLBold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  DateOfBirthPicker(),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    'Gender',
                    style: AppTypography.BodyLBold.copyWith(
                      color: theme.primaryTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GenderPicker(),
                  SizedBox(
                    height: 12.h,
                  ),
                  SimpleButton(
                    onTap: () async {
                      await Get.dialog<Widget>(const SignUpSuccess());
                      Get
                        ..back<void>()
                        ..back<void>()
                        ..find<AuthWrapperController>().signIn();
                    },
                    label: 'Save',
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DateOfBirthPicker extends StatelessWidget {
  const DateOfBirthPicker({Key? key}) : super(key: key);
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return GetX<PersonalInfoController>(
      builder: (controller) => InkWell(
        onTap: () async {
          await Get.bottomSheet<Widget>(
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                color: theme.bottomSheetColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: CupertinoDatePicker(
                backgroundColor: theme.bottomSheetColor,
                dateOrder: DatePickerDateOrder.mdy,
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime newDateTime) {
                  controller.updateDateOfBirth(newDateTime);
                },
              ),
            ),
          );
          // controller.updateDateOfBirth(
          //   await showDatePicker(
          //     context: context,
          //     initialDate: DateTime.now(),
          //     firstDate: DateTime.now().subtract(24000.days),
          //     lastDate: DateTime.now(),
          //     initialDatePickerMode: DatePickerMode.year,
          //     initialEntryMode: DatePickerEntryMode.input,
          //     currentDate: controller.dateOfBirth,
          //     builder: (context, child) => DatePickerTheme(
          //       data: DatePickerThemeData(
          //         backgroundColor: theme.scaffoldColor,
          //         headerBackgroundColor: theme.scaffoldColor,
          //         yearForegroundColor:
          //             MaterialStateProperty.resolveWith((states) {
          //           if (states.contains(MaterialState.selected)) {
          //             return AppColors.kWhite;
          //           }
          //           return theme.primaryTextColor;
          //         }),
          //         yearBackgroundColor:
          //             MaterialStateProperty.resolveWith((states) {
          //           if (states.contains(MaterialState.selected)) {
          //             return AppColors.kPrimary;
          //           }
          //           return theme.scaffoldColor;
          //         }),
          //         yearOverlayColor: MaterialStatePropertyAll(
          //           AppColors.kPrimary,
          //         ),
          //         todayBackgroundColor:
          //             MaterialStateProperty.resolveWith((states) {
          //           if (states.contains(MaterialState.selected)) {
          //             return AppColors.kPrimary;
          //           }
          //           return theme.scaffoldColor;
          //         }),
          //         todayForegroundColor:
          //             MaterialStateProperty.resolveWith((states) {
          //           if (states.contains(MaterialState.selected)) {
          //             return AppColors.kWhite;
          //           }
          //           return theme.primaryTextColor;
          //         }),
          //         todayBorder: BorderSide(
          //           color: theme.scaffoldColor,
          //           width: 0,
          //         ),
          //         yearStyle: AppTypography.BodyMMedium.copyWith(
          //           color: theme.primaryTextColor,
          //         ),
          //         rangePickerBackgroundColor: theme.scaffoldColor,
          //       ),
          //       child: child!,
          //     ),
          //   ),
          // );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.kGreyScale500, width: 1.w),
            ),
          ),
          height: 40.h,
          width: Get.width,
          child: Row(
            children: [
              if (controller.dateOfBirth == null)
                Text(
                  'MM/DD/YYYY',
                  style: AppTypography.h5Bold.copyWith(
                    color: theme.hintTextColor,
                  ),
                )
              else
                Text(
                  DateFormat.yMd().format(controller.dateOfBirth!),
                  style: AppTypography.h5Bold.copyWith(
                    color: theme.primaryTextColor,
                  ),
                ),
              const Spacer(),
              Icon(
                IconlyLight.calendar,
                color: theme.defaultIconColor,
                size: 28.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///Dialog to be displayed so user can select image from gallery or camera
class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({super.key});
  PersonalInfoController get controller => Get.find<PersonalInfoController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
      ),
      backgroundColor: theme.dialogColor,
      surfaceTintColor: theme.dialogColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Image',
            style: AppTypography.h3Bold.copyWith(
              color: AppColors.kPrimary,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              height: 45.h,
              child: InkWell(
                splashColor: TransparentColors().kRed,
                onTap: () async {
                  controller.addImageCamera();
                },
                child: Row(
                  children: [
                    Text(
                      'Select from Camera',
                      style: AppTypography.BodyLBold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      IconlyBold.camera,
                      color: AppColors.kPrimary,
                      size: 20.w,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Material(
            color: Colors.transparent,
            child: SizedBox(
              height: 45.h,
              child: InkWell(
                splashColor: TransparentColors().kRed,
                onTap: () async {
                  await controller.addImageGallery();
                },
                child: Row(
                  children: [
                    Text(
                      'Select from Gallery',
                      style: AppTypography.BodyLBold.copyWith(
                        color: AppColors.kPrimary,
                      ),
                    ),
                    const Spacer(),
                    Icon(IconlyBold.image_2,
                        color: AppColors.kPrimary, size: 20.w),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderPicker extends StatelessWidget {
  const GenderPicker({super.key});
  PersonalInfoController get controller => Get.find<PersonalInfoController>();
  ThemeService get theme => Get.find<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            children: [
              Radio<Gender?>.adaptive(
                value: Gender.Male,
                groupValue: controller.gender,
                activeColor: AppColors.kPrimary,
                onChanged: (gender) {
                  controller.updateGender(gender ?? Gender.Male);
                },
              ),
              Text(
                'Male',
                style: AppTypography.BodyLMedium.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio<Gender?>.adaptive(
                value: Gender.Female,
                groupValue: controller.gender,
                activeColor: AppColors.kPrimary,
                onChanged: (gender) {
                  controller.updateGender(gender ?? Gender.Female);
                },
              ),
              Text(
                'Female',
                style: AppTypography.BodyLMedium.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio<Gender?>.adaptive(
                value: Gender.Other,
                groupValue: controller.gender,
                activeColor: AppColors.kPrimary,
                onChanged: (gender) {
                  controller.updateGender(gender ?? Gender.Other);
                },
              ),
              Text(
                'Other',
                style: AppTypography.BodyLMedium.copyWith(
                  color: theme.primaryTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
