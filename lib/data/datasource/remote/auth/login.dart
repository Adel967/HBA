import 'package:hba/core/class/crud.dart';
import 'package:hba/linkapi.dart';

class LoginData {
  Crud crud;

  LoginData(this.crud);

  postData( String email,String password,) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
