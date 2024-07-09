import 'package:get/get.dart';
import 'package:hba/core/class/statusrequest.dart';
import 'package:hba/core/functions/handledatacontroller.dart';
import 'package:hba/core/services/services.dart';
import 'package:hba/data/datasource/remote/home_data.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:hba/data/repository/hotel_repository.dart';

import '../../data/repository/room_repository.dart';
import '../../injection_container.dart';

abstract class HomeController extends GetxController {
  getData();
  initialData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  String? username;
  String? id;
  StatusRequest statusRequest = StatusRequest.none;

  final _exploreRepository = sl<HotelRepository>();
  final _roomRepository = sl<RoomRepository>();

  // List data =[];
  List<HotelModel> hotels = [];
  List<RoomsModel> rooms = [];

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    List res = await Future.wait([
      _exploreRepository.getTopHotels(),
      _roomRepository.getRecommendedRooms()
    ]);

    hotels.addAll(res[0]);
    rooms.addAll(res[1]);

    statusRequest = StatusRequest.success;
    update();
  }
}
