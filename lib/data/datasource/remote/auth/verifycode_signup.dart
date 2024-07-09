import 'package:hba/core/class/crud.dart';
import 'package:hba/linkapi.dart';

class VerifycodeSignUpData {
  Crud crud;

  VerifycodeSignUpData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUp, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.resendCode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
