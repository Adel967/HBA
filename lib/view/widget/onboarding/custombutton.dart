import 'package:hba/controller/onboarding_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
        height: 40,
        color: AppColor.general,
        textColor: Colors.white,
        child: Text(
          "8".tr,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
