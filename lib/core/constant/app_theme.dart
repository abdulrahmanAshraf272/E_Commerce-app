import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    appBarTheme: AppBarTheme(color: Colors.orange),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.orange),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    primarySwatch: Colors.orange,
    fontFamily: 'Cairo',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
        bodyLarge: TextStyle(height: 2, color: AppColor.grey)));

ThemeData themeArabic = ThemeData(
    fontFamily: 'Cairo',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
        bodyLarge: TextStyle(height: 2, color: AppColor.grey)));
