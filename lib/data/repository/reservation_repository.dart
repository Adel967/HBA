import 'package:hba/data/data_provider/hotel_provider.dart';
import 'package:hba/data/data_provider/reservations_provider.dart';
import 'package:hba/data/data_provider/room_provider.dart';
import 'package:hba/data/model/bookedRoom.dart';
import 'package:hba/data/model/room_model.dart';

import '../model/hotel_model.dart';

class ReservationRepository {
  ReservationProvider _reservationProvider;
  HotelProvider _hotelProvider;
  RoomProvider _roomProvider;

  ReservationRepository(
      this._reservationProvider, this._hotelProvider, this._roomProvider);

  Future<List<BookedRoom>> getBookedRooms() async {
    final res = await _reservationProvider.getReservations();
    final List<BookedRoom> bookedRooms =
        getBookedRoomsListFromListMap(res.docs);
    if (bookedRooms.isEmpty) {
      return [];
    }
    List<String> roomIds = [];
    List<String> hotelIds = [];
    for (BookedRoom bookedRoom in bookedRooms) {
      roomIds.add(bookedRoom.roomId!);
      hotelIds.add(bookedRoom.hotelId!);
    }
    roomIds = List.from(roomIds.toSet().toList());
    hotelIds = List.from(hotelIds.toSet().toList());

    final hotelRes = await _hotelProvider.getHotelsByIds(hotelIds);
    final roomRes = await _roomProvider.getRecommendedById(roomIds);
    print(hotelRes.docs[0].data());
    final hotels = getHotelListFromListMap(hotelRes.docs);
    final rooms = getRoomListFromListMap(roomRes.docs);

    await Future.forEach(bookedRooms, (element) {
      HotelModel hotel =
          hotels.where((hotel) => hotel.hotelsId == element.hotelId).first;
      RoomsModel room = rooms.where((room) => room.id == element.roomId).first;
      element.hotel = hotel;
      element.room = room;
    });

    return bookedRooms;
  }
}
