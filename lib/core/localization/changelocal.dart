import 'package:hba/core/constant/apptheme.dart';
import 'package:hba/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    language = Locale(langcode);
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    print("LocalInit");
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }

  static final all = [
    const Locale(Constants.LANG_AR),
    const Locale(Constants.LANG_EN),
  ];

  static String getFlag(String code) {
    switch (code) {
      case Constants.LANG_AR:
        return 'eg';
      case Constants.LANG_EN:
      default:
        return 'us';
    }
  }

  static String getLanguageName(String code) {
    switch (code) {
      case Constants.LANG_AR:
        return 'العربية';
      case Constants.LANG_EN:
      default:
        return 'English';
    }
  }
}
