import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/firebase/firestore_keys.dart';

class RoomProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getHotelRooms(
      String hotelId) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.rooms_collections)
        .where("hotelId", isEqualTo: hotelId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getRecommendedRooms() async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.rooms_collections)
        .where("withOffer", isEqualTo: true)
        .limit(5)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getRecommendedById(
      List<String> ids) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.rooms_collections)
        .where(FieldPath.documentId, whereIn: ids)
        .get();
  }
}
