// ignore_for_file: avoid_print

import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;

  StatusRequest statusRequest= StatusRequest.none;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  @override
  checkEmail() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      print("---------- $response");
      statusRequest = handleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
        } else {
          Get.defaultDialog(title: "Warning", middleText: "Email Not Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
