import 'package:dartz/dartz.dart';

import '../../../core/enum.dart';
import '../data_provider/profile_provider.dart';

class ProfileRepository {
  ProfileProvider _profileProvider;

  ProfileRepository(this._profileProvider);

  Future<void> createUserProfile(
      String userName, phone, birthDate, Gender gender) async {
    await _profileProvider.createUserProfile(userName, phone, birthDate, gender);
  }
}
