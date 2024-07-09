import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/repository/hotel_repository.dart';
import '../core/class/statusrequest.dart';
import '../injection_container.dart';

abstract class RoomDetailController extends GetxController {
  getData();
}

class RoomDetailControllerImp extends RoomDetailController {
  StatusRequest statusRequest = StatusRequest.none;

  final _hotelRepository = sl<HotelRepository>();

  HotelModel? hotelModel;

  final String hotelId;

  RoomDetailControllerImp(this.hotelId);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await _hotelRepository.getHotel(hotelId);
    hotelModel = response;
    statusRequest = StatusRequest.success;

    update();
  }
}
