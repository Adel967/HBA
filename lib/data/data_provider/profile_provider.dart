import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/enum.dart';
import '../model/user_model.dart';

class ProfileProvider {
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  User currentUser = _auth.currentUser!;

  Future<void> createUserProfile(
      String userName, phoneNumber, birthDate, Gender gender) async {
    UserModel user = UserModel(
        id: currentUser.uid,
        email: currentUser.email,
        userName: userName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        gender: gender,
        createdAt: DateTime.now().toString(),
        pushToken: "");

    await _firebaseFirestore
        .collection("users")
        .doc(currentUser.uid)
        .set(user.toMap())
        .then((value) => currentUser.updateDisplayName(userName));
  }
}
