import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hba/core/enum.dart';

import '../../../core/firebase/firestore_keys.dart';
import '../params/search_params.dart';

class SearchProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> searchHotels() async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.hotels_collections)
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> searchRooms() async {
    return await FirebaseFirestore.instance
        .collection(FireStoreKeys.rooms_collections)
        .get();
  }
}
