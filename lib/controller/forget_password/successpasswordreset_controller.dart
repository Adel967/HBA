import 'package:hba/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessPasswordcontrollerReset extends GetxController {
  gotoLogin();
}

class SuccessPasswordcontrollerResetImp extends SuccessPasswordcontrollerReset {
  @override
  gotoLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
