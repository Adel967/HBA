import 'package:hba/core/constant/routes.dart';
import 'package:hba/core/services/services.dart';
import 'package:hba/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/shared_preferences/shared_preferences_instance.dart';
import '../core/shared_preferences/shared_preferences_key.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;

  MyServices myServices = Get.find();

  @override
  next() {
    currentPage++;

    if (currentPage > onboardingList.length - 1) {
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(AppRoute.login);
      SharedPreferencesInstance.pref
          .setBool(SharedPreferencesKeys.FIRST_TIME_KEY, false);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
