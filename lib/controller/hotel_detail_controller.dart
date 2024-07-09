import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hba/data/repository/room_repository.dart';

import '../core/class/statusrequest.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';
import '../injection_container.dart';

abstract class HotelDetailController extends GetxController {
  getData();
}

class HotelDetailControllerImp extends HotelDetailController {
  StatusRequest statusRequest = StatusRequest.none;

  final _roomRepository = sl<RoomRepository>();

  List rooms = [];

  final String hotelId;

  HotelDetailControllerImp(this.hotelId);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await _roomRepository.getTopHotels(hotelId);
    rooms.addAll(response);
    statusRequest = StatusRequest.success;

    // var response = await homeData.getData();
    // print("---------- $response");
    // statusRequest = handleData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     hotels.addAll(response['hotels']);
    //     rooms.addAll(response['rooms']);
    //   } else {
    //     statusRequest = StatusRequest.failure;
    //     print("fail");
    //   }
    // } else {
    //   print("fail");
    //   statusRequest = StatusRequest.failure;
    // }
    update();
  }
}
