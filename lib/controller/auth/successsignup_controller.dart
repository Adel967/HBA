import 'package:hba/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpcontroller extends GetxController{
  gotoLogin();
}

class  SuccessSignUpcontrollerImp extends SuccessSignUpcontroller{
  @override
  gotoLogin() {
    Get.offAllNamed(AppRoute.login);
  }

}