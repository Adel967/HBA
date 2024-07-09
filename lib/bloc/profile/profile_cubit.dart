import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/enum.dart';
import '../../../injection_container.dart';
import '../../data/repository/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  ProfileRepository _profileRepository = sl<ProfileRepository>();

  setUpProfile(String userName, phone, birthDate, Gender gender) async {
    emit(ProfileUploading());
    try {
      await _profileRepository.createUserProfile(
          userName, phone, birthDate, gender);
      emit(ProfileUploaded());
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
