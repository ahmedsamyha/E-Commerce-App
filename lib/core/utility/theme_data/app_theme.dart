import 'package:flutter/material.dart';
import 'package:snapshop/core/utility/constants/colors.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/app_bar_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/bottom_sheet_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/check_box_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/chip_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/elevated_button_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/outline_button_theme.dart';
import 'package:snapshop/core/utility/theme_data/custom_theme/text_form_field_theme.dart';

import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();

  // ----------------Light Theme---------------

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
  );

  // ----------------dark Theme---------------

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
  );
}
