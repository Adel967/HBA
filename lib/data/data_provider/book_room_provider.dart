import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hba/data/model/bookedRoom.dart';

import '../../core/firebase/firestore_keys.dart';

class BookRoomProvider {
  Future<DocumentReference<Map<String, dynamic>>> bookRoom(
      BookedRoom bookedRoom) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.bookedRooms_collections)
        .add(bookedRoom.toMap());
  }

  Future<bool> isRoomAvailable(BookedRoom bookedRoom) async {
    String roomId = bookedRoom.roomId!;
    DateTime startDate = bookedRoom.startDate!;
    int nightsCount = bookedRoom.nightsCount!;

    // Calculate end date
    DateTime endDate = startDate.add(Duration(days: nightsCount));

    // Query to get bookings for the specified room
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(FireStoreKeys.bookedRooms_collections)
        .where('roomId', isEqualTo: roomId)
        .get();

    // Iterate through the documents to check for date overlaps
    for (var doc in querySnapshot.docs) {
      DateTime bookedStartDate = (doc['startDate'] as Timestamp).toDate();
      DateTime bookedEndDate =
          bookedStartDate.add(Duration(days: doc['nightsCount']));

      // Check if there is an overlap
      if (startDate.isBefore(bookedEndDate) &&
          endDate.isAfter(bookedStartDate)) {
        // Room is not available
        return false;
      }
    }

    // Room is available
    return true;
  }
}
