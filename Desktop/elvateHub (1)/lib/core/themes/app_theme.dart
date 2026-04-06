// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elvateHub/core/helpers/string_constant.dart';
import 'package:elvateHub/core/themes/app_colors.dart';

class AppTheme {
  static Locale? locale;

  const AppTheme._();

  static double height = 1.5;

  static final lightTheme = ThemeData(
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.scaffoldColor; // Active thumb color
        }
        return AppColors.greyFiledColor; // Inactive thumb color
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor; // Active track color
        }
        return AppColors.greyColor; // Inactive track color
      }),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppColors.scaffoldColor,
    ),
    checkboxTheme: CheckboxThemeData(
      side: BorderSide(
        color: AppColors.greyColor,
        width: 1.5.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          4.r,
        ),
        side: BorderSide(
          color: AppColors.greyTextFiledColor,
          width: 1.5.w,
        ),
      ),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.scaffoldColor;
      }),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.scaffoldColor;
        }
        return AppColors.greyBorderFiledColor;
      }),
    ),
    platform: TargetPlatform.iOS,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    brightness: Brightness.light,
    cardColor: AppColors.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryColor;
        }
        return AppColors.primaryColor;
      }),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        height: height,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: locale != null
            ? (locale!.languageCode == arabicCode
                ? arabicFontFamily
                : englishFontFamily)
            : arabicFontFamily,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    ),
    fontFamily: locale == null || locale!.languageCode == arabicCode
        ? arabicFontFamily
        : englishFontFamily,
    buttonTheme: ButtonThemeData(
      minWidth: double.infinity,
      height: 60.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(
          AppColors.lightPrimaryColor,
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        height: height,
        fontSize: 18,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      titleMedium: TextStyle(
        height: height,
        fontSize: 14,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      titleSmall: TextStyle(
        height: height,
        fontSize: 12,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.bold,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      labelLarge: TextStyle(
        height: height,
        fontSize: 18,
        color: AppColors.primaryTextColor,
        fontWeight: FontWeight.normal,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      labelMedium: TextStyle(
        height: height,
        fontSize: 13,
        color: AppColors.primaryTextColor,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      bodyLarge: TextStyle(
        height: height,
        fontSize: 14,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
        color: AppColors.greyColor,
      ),
      bodyMedium: TextStyle(
        height: height,
        fontSize: 15,
        color: AppColors.primaryTextColor,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
      bodySmall: TextStyle(
        height: height,
        fontSize: 16,
        color: AppColors.primaryTextColor,
        fontFamily: locale == null || locale!.languageCode == arabicCode
            ? arabicFontFamily
            : englishFontFamily,
      ),
    ),
    highlightColor: AppColors.lightGreyColor,
    iconTheme: const IconThemeData().copyWith(size: 18.w),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.lightPrimaryColor,
    ).copyWith(surface: AppColors.lightGreyColor),
  );

  // static final darkTheme = ThemeData(
  //   platform: TargetPlatform.iOS,
  //   primaryColor: AppColors.primaryColor,
  //   scaffoldBackgroundColor: AppColors.scaffoldDarkColor,
  //   brightness: Brightness.dark,
  //   cardColor: lightPrimary2,
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //     centerTitle: false,
  //     iconTheme: const IconThemeData(color: whiteColor),
  //     titleTextStyle: TextStyle(
  //       height: height,
  //       fontSize: 25,
  //       fontWeight: FontWeight.w700,
  //       color: scaffoldColor,
  //       fontFamily: locale != null
  //           ? (locale!.languageCode == arabicCode
  //               ? arabicFontFamily
  //               : englishFontFamily)
  //           : arabicFontFamily,
  //     ),
  //     systemOverlayStyle: const SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarBrightness: Brightness.dark,
  //       statusBarIconBrightness: Brightness.light,
  //       systemNavigationBarIconBrightness: Brightness.light,
  //       systemNavigationBarDividerColor: Colors.transparent,
  //     ),
  //   ),
  //   canvasColor: scaffoldDarkColor,
  //   fontFamily: locale == null || locale!.languageCode == arabicCode
  //       ? arabicFontFamily
  //       : englishFontFamily,
  //   buttonTheme: ButtonThemeData(
  //     minWidth: double.infinity,
  //     height: 60.h,
  //     buttonColor: lightPrimary,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadiusDirectional.circular(10)),
  //   ),
  //   textButtonTheme: TextButtonThemeData(
  //     style: ButtonStyle(
  //       foregroundColor: MaterialStateProperty.all<Color>(
  //         lightPrimary,
  //       ),
  //     ),
  //   ),
  //   textTheme: TextTheme(
  //     titleLarge: TextStyle(
  //       fontSize: 24,
  //       color: scaffoldColor,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     titleMedium: TextStyle(
  //       fontSize: 20,
  //       color: scaffoldColor,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     titleSmall: TextStyle(
  //       fontSize: 16,
  //       color: scaffoldColor,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     labelLarge: TextStyle(
  //       fontSize: 26,
  //       color: scaffoldColor,
  //       fontWeight: FontWeight.normal,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     labelMedium: TextStyle(
  //       fontSize: 22,
  //       color: scaffoldColor,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     bodyMedium: TextStyle(
  //       fontSize: 19,
  //       color: scaffoldColor,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     bodySmall: TextStyle(
  //       fontSize: 18,
  //       color: scaffoldColor,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //     bodyLarge: TextStyle(
  //       fontSize: 18,
  //       color: greyColor,
  //       fontFamily: locale == null || locale!.languageCode == arabicCode
  //           ? arabicFontFamily
  //           : englishFontFamily,
  //     ),
  //   ),
  //   highlightColor: lightGrey,
  //   iconTheme: const IconThemeData().copyWith(size: 18.w),
  //   bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
  //   colorScheme: ColorScheme.fromSwatch(
  //     accentColor: lightPrimary,
  //     primarySwatch: primarySwatch,
  //   ).copyWith(background: lightBgGrey2, brightness: Brightness.dark),
  // );
}
