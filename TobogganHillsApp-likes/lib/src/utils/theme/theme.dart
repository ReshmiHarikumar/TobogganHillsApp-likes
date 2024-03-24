import 'package:flutter/material.dart';
import 'package:toboggan_hills/src/utils/constants/colors.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/appbar_theme.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/bottom_sheet.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/chip_theme.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/outlined_button.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/text_field_theme.dart';
import 'package:toboggan_hills/src/utils/theme/custom_themes/text_theme.dart';

class CustomTheme {
  CustomTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightTheme,
    appBarTheme: CustomAppBarTheme.lightTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: CustomColors.primaryColor,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkTheme,
    appBarTheme: CustomAppBarTheme.darkTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
  );
}
