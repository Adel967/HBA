import 'package:hba/data/data_provider/room_provider.dart';
import 'package:hba/data/model/room_model.dart';

class RoomRepository {
  RoomProvider _roomProvider;

  RoomRepository(this._roomProvider);

  Future<List<RoomsModel>> getTopHotels(String hotelId) async {
    final res = await _roomProvider.getHotelRooms(hotelId);
    final List<RoomsModel> hotels = getRoomListFromListMap(res.docs);
    return hotels;
  }

  Future<List<RoomsModel>> getRecommendedRooms() async {
    final res = await _roomProvider.getRecommendedRooms();
    final List<RoomsModel> hotels = getRoomListFromListMap(res.docs);
    return hotels;
  }
}
