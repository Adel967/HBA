// ignore_for_file: avoid_print
import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/core/services/services.dart';
import 'package:hba/data/datasource/remote/auth/login.dart';

abstract class LoginCotroller extends GetxController {
  login();
  goToSignup();
  goToForgetPassword();
}

class LoginCotrollerImp extends LoginCotroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShownPassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());

  showPassword() {
    isShownPassword = !isShownPassword;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handleData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'].toString() == "1") {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            // String userid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");

            // FirebaseMessaging.instance.subscribeToTopic("users");
            // FirebaseMessaging.instance.subscribeToTopic("users${userid}");

            Get.offNamed(AppRoute.homePage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp,
                arguments: {"email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
