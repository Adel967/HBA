part of 'profile_cubit.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileInitial extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileUploading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileUploaded extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileError extends ProfileState {
  final String error;

  ProfileError({required this.error});

  @override
  List<Object?> get props => [this.error];
}
