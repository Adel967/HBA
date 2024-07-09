import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hba/data/repository/reservation_repository.dart';
import 'package:meta/meta.dart';

import '../../data/model/bookedRoom.dart';
import '../../injection_container.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());
  ReservationRepository _reservationRepository = sl<ReservationRepository>();

  getReservations() async {
    emit(ReservationLoading());
    try {
      final res = await _reservationRepository.getBookedRooms();
      emit(ReservationLoaded(reservations: res));
    } catch (e) {
      emit(ReservationError(error: "There is an error!"));
    }
  }

  cancelReservation(String reservationId) {
    if (state is ReservationLoaded) {
      List<BookedRoom> bookedRoom = (state as ReservationLoaded).reservations!;
      bookedRoom.removeWhere((element) => element.id == reservationId);
      emit(ReservationLoading());

      emit(ReservationLoaded(reservations: bookedRoom));
    }
  }
}
