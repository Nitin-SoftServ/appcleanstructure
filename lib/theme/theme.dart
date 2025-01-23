
import 'package:appstructureapp/styles/colors.dart';
import 'package:appstructureapp/theme/buttom_theme.dart';
import 'package:flutter/material.dart';
AppBarTheme appBarTheme = const AppBarTheme();
ThemeData themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.colSecondary,
    primary: AppColors.colPrimary,
    secondary: AppColors.colSecondary,
    brightness: Brightness.dark,
    background: AppColors.colBackground,
  ),

  primaryColor:AppColors.colPrimary,
  hintColor: AppColors.colSecondary,
  appBarTheme: appBarTheme,
  elevatedButtonTheme: buttonTheme,
  useMaterial3: true,
  fontFamily: "Satoshi",
  scaffoldBackgroundColor: Colors.white,
);
