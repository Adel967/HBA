import 'package:hba/controller/forget_password/forgetpassword_controller.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/functions/validinput.dart';
import 'package:hba/view/widget/auth/customtextenteringauth.dart';
import 'package:hba/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/auth/custombuttonauth.dart';
import '../../../widget/auth/customtextbodyauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "14".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        elevation: 0.0,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextTitleAuth(text: "27".tr),
                      const SizedBox(height: 15),
                      CustomTextBodyAuth(text: "29".tr),
                      const SizedBox(height: 40),
                      CustomEnteringTextAuth(
                        labeltext: "18".tr,
                        hinttext: "12".tr,
                        icon: Icons.email_outlined,
                        mycontroller: controller.email,
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                      ),
                      CustomButtonAuth(
                        text: "30".tr,
                        onPressed: () {
                          controller.checkEmail();
                        },
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
