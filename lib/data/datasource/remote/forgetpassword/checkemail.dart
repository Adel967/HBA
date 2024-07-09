import 'package:hba/core/class/crud.dart';
import 'package:hba/linkapi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkemail, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
