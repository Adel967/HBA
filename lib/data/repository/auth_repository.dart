import 'package:hba/data/data_provider/auth_provider.dart' as auth;
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exception/app_exceptions.dart';

class AuthRepository {
  auth.AuthProvider _authProvider;

  AuthRepository(this._authProvider);

  Future<Either<AppException, UserCredential>> logIn(
      String email, password) async {
    try {
      final UserCredential user = await _authProvider.logIn(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AppException(getMessageFromErrorCode(e.code)));
    }
  }

  Future<Either<AppException, UserCredential>> register(
      String email, password) async {
    try {
      final UserCredential user = await _authProvider.register(email, password);
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(AppException(getMessageFromErrorCode(e.code)));
    }
  }

  String getMessageFromErrorCode(String error) {
    switch (error) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      default:
        return "Login failed. Please try again.";
    }
  }
}
