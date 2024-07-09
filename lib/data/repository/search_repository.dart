import 'package:dartz/dartz.dart';
import 'package:hba/core/enum.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/model/room_model.dart';

import '../data_provider/search_provider.dart';
import '../params/search_params.dart';

class SearchRepository {
  SearchProvider _searchProvider;

  SearchRepository(this._searchProvider);

  Future<Either<List<RoomsModel>, List<HotelModel>>> search(
      SearchParams searchParams) async {
    print(searchParams.toString());
    if (searchParams.filterType == FilterType.HOTELS) {
      final res = await _searchProvider.searchHotels();
      final List<HotelModel> resHotels = getHotelListFromListMap(res.docs);
      List<HotelModel> hotels = [];
      hotels = List.from(resHotels.where((element) {
        if (!element.address!.contains(searchParams.city ?? "")) {
          return false;
        }
        if (searchParams.title != null) {
          if (!element.hotelsName!
              .toUpperCase()
              .contains(searchParams.title!.toUpperCase())) {
            return false;
          }
        }
        return true;
      }));
      return Right(hotels);
    } else {
      final res = await _searchProvider.searchRooms();
      final List<RoomsModel> resRooms = getRoomListFromListMap(res.docs);
      List<RoomsModel> rooms = [];
      List<HotelModel> hotels = [];
      if ((searchParams.city != null && searchParams.city!.isNotEmpty) ||
          searchParams.title != null) {
        final resH = await _searchProvider.searchHotels();

        final List<HotelModel> resHotels = getHotelListFromListMap(resH.docs);
        hotels = List.from(resHotels.where((element) {
          if (!element.address!.contains(searchParams.city ?? "")) {
            return false;
          }
          if (element.hotelsName != null && searchParams.title != null) {
            if (!element.hotelsName!
                .toUpperCase()
                .contains(searchParams.title!.toUpperCase())) {
              return false;
            }
          }
          return true;
        }));
      }
      rooms = List.from(resRooms.where((room) {
        List<HotelModel> filters =
            List.from(hotels.where((hotel) => hotel.hotelsId == room.hotelId));
        if (filters.isEmpty) {
          return false;
        }
        print(searchParams.roomType);
        if (searchParams.roomType != null &&
            !searchParams.roomType!
                .toUpperCase()
                .contains(room.type!.toUpperCase() ?? "")) {
          return false;
        }
        if (searchParams.startPrice != null) {
          if (room.price! < searchParams.startPrice! ||
              room.price! > searchParams.endPrice!) {
            return false;
          }
        }
        return true;
      }));
      return Left(rooms);
    }
  }
}
