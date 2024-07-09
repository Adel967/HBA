import 'package:get/get.dart';
import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/data/datasource/remote/test_data.dart';

class TestController extends GetxController{
  TestData testData =TestData(Get.find());

  List data =[];

  late StatusRequest statusRequest;

  getData() async{
    statusRequest =StatusRequest.loading;
    var response = await testData.getData();
    print("---------- $response");  
    statusRequest =handleData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        data.addAll(response['data']);
      }
      else{
        statusRequest =StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
