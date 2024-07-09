import 'package:hba/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) => controller.onPageChanged(value),
      itemCount: onboardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(onboardingList[i].title!,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          const SizedBox(
            height: 40,
          ),
          Image.asset(
            onboardingList[i].image!,
            //width: 230,
            height:  Get.width/1.6,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                onboardingList[i].body!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, height: 2, color: AppColor.grey),
              )),
        ],
      ),
    );
  }
}
