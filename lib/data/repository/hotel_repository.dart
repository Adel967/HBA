import 'package:hba/data/data_provider/hotel_provider.dart';
import 'package:hba/data/model/hotel_model.dart';

class HotelRepository {
  HotelProvider _exploreProvider;

  HotelRepository(this._exploreProvider);

  Future<List<HotelModel>> getTopHotels() async {
    final res = await _exploreProvider.getTopHotels();
    final List<HotelModel> hotels = getHotelListFromListMap(res.docs);
    return hotels;
  }

  Future<HotelModel> getHotel(String hotelId) async {
    final res = await _exploreProvider.getHotel(hotelId);
    final HotelModel hotel = HotelModel.fromJson(res.data()!);
    hotel.hotelsId = hotelId;
    return hotel;
  }
}
