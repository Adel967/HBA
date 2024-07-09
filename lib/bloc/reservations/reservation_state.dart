part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState extends Equatable {}

class ReservationInitial extends ReservationState {
  @override
  List<Object?> get props => [];
}

class ReservationLoading extends ReservationState {
  @override
  List<Object?> get props => [];
}

class ReservationLoaded extends ReservationState {
  List<BookedRoom> reservations = [];

  ReservationLoaded({required this.reservations});

  @override
  List<Object?> get props => [];
}

class ReservationError extends ReservationState {
  final String error;

  ReservationError({required this.error});

  @override
  List<Object?> get props => [this.error];
}
