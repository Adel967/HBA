import 'package:hba/controller/forget_password/verifycode_controller.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../widget/auth/customtextbodyauth.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          centerTitle: true,
          title: Text(
            "42".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          elevation: 0.0,
        ),
        body: GetBuilder<VerifyCodeCotrollerImp>(
          builder: (controller) => HandlingDataViewRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextTitleAuth(text: "43".tr),
                  const SizedBox(height: 15),
                   CustomTextBodyAuth(
                    text:
                        "Please Enter The Digit Code Sent to ${controller.email} ",
                  ),
                  const SizedBox(height: 40),
                  OtpTextField(
                    fieldWidth: 50,
                    borderRadius: BorderRadius.circular(20),
                    numberOfFields: 5,
                    borderColor: const Color(0xFF512DA8),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {},
                    onSubmit: (String verificationCode) {
                      controller.checkCode(verificationCode);
                    },
                  ),
                  const SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        controller.reSend();
                      },
                      child: const Center(
                          child: Text(
                        "Resend verfiy code",
                        style: TextStyle(color: AppColor.general, fontSize: 20),
                      )),
                    )
                ],
              ),
            ),
          ),
        ));
  }
}
