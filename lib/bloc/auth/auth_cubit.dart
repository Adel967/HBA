import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../injection_container.dart';
import '../../data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  AuthRepository _authRepository = sl<AuthRepository>();

  login(String email, password) async {
    emit(AuthLoading());
    final res = await _authRepository.logIn(email, password);
    emit(res.fold(
        (l) => AuthError(error: l.message!), (r) => AuthLoaded(user: r.user)));
  }

  signUp(String email, password) async {
    emit(AuthLoading());
    final res = await _authRepository.register(email, password);
    emit(res.fold(
        (l) => AuthError(error: l.message!), (r) => AuthLoaded(user: r.user)));
  }
}
