import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/auth/verifycode_signup.dart';

abstract class VerifyCodeSignUpCotroller extends GetxController {
  checkCode(String verificationCode);
}

class VerifyCodeSignUpCotrollerImp extends VerifyCodeSignUpCotroller {
  String? email;

  VerifycodeSignUpData verifycodeSignUpData = VerifycodeSignUpData(Get.find());
  StatusRequest statusRequest= StatusRequest.none;

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifycodeSignUpData.postData(email!, verificationCode);
    print("---------- $response");
    statusRequest = handleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Invalid Code");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend(){
    verifycodeSignUpData.resendData(email!);
  }
}
