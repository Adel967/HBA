import 'package:hba/core/class/crud.dart';
import 'package:hba/linkapi.dart';

class HomeData{
  Crud crud;

  HomeData(this.crud);

  getData() async{
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }
}