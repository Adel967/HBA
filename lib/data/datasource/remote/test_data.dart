import 'package:hba/core/class/crud.dart';
import 'package:hba/linkapi.dart';
class TestData{
  Crud crud;

  TestData(this.crud);

  getData() async{
    var response = await crud.postData(AppLink.test, {});
    return response.fold((l) => l, (r) => r);
  }
}