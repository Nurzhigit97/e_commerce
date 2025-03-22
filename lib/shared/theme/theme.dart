import 'package:e_commerce/shared/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  primaryColor: AppColors.primary,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColors.scaffoldColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w700,
    ),
    foregroundColor: Colors.black,
    backgroundColor: AppColors.scaffoldColor,
    surfaceTintColor: Colors.white,
  ),
  colorScheme: const ColorScheme(
    primary: AppColors.primary,
    secondary: AppColors.primary,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xff2EB55B),
    selectedIconTheme: IconThemeData(color: Color(0xff2EB55B)),
    type: BottomNavigationBarType.fixed,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: AppColors.black,
    unselectedLabelColor: AppColors.black,
    dividerColor: Colors.transparent,
    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    unselectedLabelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2, color: AppColors.primaryColor),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  ),
);
