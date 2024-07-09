import 'package:hba/controller/forget_password/resetpassword_controller.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/functions/validinput.dart';
import 'package:hba/view/widget/auth/customtextenteringauth.dart';
import 'package:hba/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          centerTitle: true,
          title: Text(
            "39".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    CustomTextTitleAuth(text: "35".tr),
                    const SizedBox(height: 15),
                    CustomTextBodyAuth(text: "34".tr),
                    const SizedBox(height: 40),
                    CustomEnteringTextAuth(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      labeltext: "19".tr,
                      hinttext: "40".tr,
                      icon: Icons.password_outlined,
                      mycontroller: controller.password,
                    ),
                    CustomEnteringTextAuth(
                      labeltext: "19".tr,
                      hinttext: "41".tr,
                      icon: Icons.password_outlined,
                      mycontroller: controller.repassword,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                    ),
                    CustomButtonAuth(
                      text: "33".tr,
                      onPressed: () {
                        controller.resetPassword();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
