import 'package:hba/data/data_provider/book_room_provider.dart';
import 'package:hba/data/model/bookedRoom.dart';

class BookRoomRepository {
  BookRoomProvider _bookRoomProvider;

  BookRoomRepository(this._bookRoomProvider);

  Future<bool> bookRoom(BookedRoom bookedRoom) async {
    final res = await _bookRoomProvider.bookRoom(bookedRoom);
    if (res.id.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> checkIfRoomAvailable(BookedRoom bookedRoom) async {
    return await _bookRoomProvider.isRoomAvailable(bookedRoom);
  }
}
