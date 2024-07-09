// ignore_for_file: avoid_print

import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  String? email;
  late TextEditingController password;
  late TextEditingController repassword;
  ResetPasswordData resetPasswordData =ResetPasswordData(Get.find());
  StatusRequest statusRequest= StatusRequest.none;

  @override
  resetPassword() async{
    if(password.text != repassword.text)
    {
      return Get.defaultDialog(
            title: "Warning", middleText: "Password Not Match");//designed later
    }
    if(formstate.currentState!.validate()){
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.postData(email!, password.text);
    print("---------- $response");
    statusRequest = handleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.successPasswordReset );
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Try Again");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    }
  }

  

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
