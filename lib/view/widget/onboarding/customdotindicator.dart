import 'package:hba/controller/onboarding_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotIndicatorOnBoarding extends StatelessWidget {
  const CustomDotIndicatorOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => SmoothPageIndicator(
              controller: controller.pageController,
              count: onboardingList.length,
              effect: JumpingDotEffect(
                  activeDotColor: AppColor.general,
                  dotColor: Colors.blue.shade100,
                  dotHeight: 10,
                  dotWidth: 10,
                  spacing: 16),
            ));
  }
}
