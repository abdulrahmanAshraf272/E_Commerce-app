import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    primarySwatch: Colors.blue,
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
