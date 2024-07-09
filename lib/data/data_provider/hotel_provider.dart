import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/firebase/firestore_keys.dart';

class HotelProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getTopHotels() async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.hotels_collections)
        .orderBy("rating", descending: true)
        .limit(5)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getHotel(
      String hotelId) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.hotels_collections)
        .doc(hotelId)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getHotelsByIds(
      List<String> ids) async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.hotels_collections)
        .where(FieldPath.documentId, whereIn: ids)
        .get();
  }
}
