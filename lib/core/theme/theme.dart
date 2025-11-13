import 'package:flutter/material.dart';
import 'package:shopverse/core/theme/colors.dart';

class ThemesManager {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: ColorsManager.scaffoldColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorsManager.scaffoldColor,
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
  );
}
