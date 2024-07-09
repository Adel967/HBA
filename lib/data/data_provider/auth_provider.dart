import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  Future<UserCredential> register(String email, password) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> logIn(String email, password) async {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
