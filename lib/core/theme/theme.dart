import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/colors.dart';

class ThemesManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.primaryColor,
    scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryColor,
      // titleTextStyle: TextStylesManager.bold20.copyWith(
      //   color: ColorsManager.whiteColor,
      // ),
      iconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorsManager.primaryDarkColor,
    scaffoldBackgroundColor: ColorsManager.scaffoldDarkBackgroundColor,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryDarkColor,
      // titleTextStyle: TextStylesManager.bold20.copyWith(
      //   color: ColorsManager.whiteColor,
      // ),
      iconTheme: IconThemeData(
        color: ColorsManager.whiteColor,
      ),
    ),
  );
}
