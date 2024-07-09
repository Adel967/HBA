import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  primaryColor: AppColor.general,
  fontFamily: "OpenSans",
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
        fontSize: 20,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold),
  ),
);


ThemeData themeArabic = ThemeData(
  primaryColor: AppColor.general,
  fontFamily: "Cario",
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
        fontSize: 20,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(
        fontSize: 14,
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold),
  ),
);