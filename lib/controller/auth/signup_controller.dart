// ignore_for_file: avoid_print

import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/auth/signup.dart';

abstract class SignUpCotroller extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpCotrollerImp extends SignUpCotroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest= StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signUp() async {
    if(formstate.currentState!.validate()){
    statusRequest = StatusRequest.loading;
    update();
    var response = await signupData.postData(
        username.text, password.text, email.text, phone.text);
    print("---------- $response");
    statusRequest = handleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRoute.verifyCodeSignUp , arguments: {
          "email" : email.text
        });
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Email or Phone Already Exist");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
