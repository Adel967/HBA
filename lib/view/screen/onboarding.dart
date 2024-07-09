import 'package:hba/controller/onboarding_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/onboarding/custombutton.dart';
import 'package:hba/view/widget/onboarding/customdotindicator.dart';
import 'package:hba/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(  
      backgroundColor: AppColor.background,
        body: const SafeArea(
      child: Column(
        children: [ Expanded(
            flex: 4 ,
            child:  CustomSliderOnBoarding(),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomDotIndicatorOnBoarding()
                  ],
                ),
                 Spacer(flex: 2,),
                 CustomButtonOnBoarding(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
