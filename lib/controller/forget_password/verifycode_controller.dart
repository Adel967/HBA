import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/forgetpassword/verifycode.dart';

abstract class VerifyCodeCotroller extends GetxController {
  checkCode(String verificationCode);
}

class VerifyCodeCotrollerImp extends VerifyCodeCotroller {
  String? email;
  StatusRequest statusRequest= StatusRequest.none;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());

  @override
  checkCode(String verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verificationCode);
    print("---------- $response");
    statusRequest = handleData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
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
    verifyCodeForgetPasswordData.resendData(email!);
  }
}
