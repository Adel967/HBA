import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:hba/data/model/bookedRoom.dart';
import 'package:hba/data/repository/book_room_repository.dart';
import 'package:meta/meta.dart';

import '../../injection_container.dart';

part 'book_room_state.dart';

class BookRoomCubit extends Cubit<BookRoomState> {
  BookRoomCubit() : super(BookRoomInitial());
  BookRoomRepository _bookRoomRepository = sl<BookRoomRepository>();

  bookRoom(BookedRoom bookedRoom) async {
    emit(BookRoomLoading());
    try {
      final res = await _bookRoomRepository.bookRoom(bookedRoom);
      if (res) {
        emit(BookRoomLoaded());
      } else {
        emit(BookRoomError(error: "There is an error!"));
      }
    } catch (e) {
      emit(BookRoomError(error: "errorContactUs".tr));
    }
  }

  Future<bool> checkIfRoomAvailable(BookedRoom bookedRoom) async {
    emit(BookRoomLoading());
    //try {
    bool isRoomAvailable =
        await _bookRoomRepository.checkIfRoomAvailable(bookedRoom);
    if (isRoomAvailable) {
      emit(BookRoomChecked());
      return true;
    } else {
      emit(BookRoomError(error: "roomIsNotAvailable".tr));
      return false;
    }
    // } catch (e) {
    //   emit(BookRoomError(error: "errorContactUs".tr));
    //   return false;
    // }
  }
}
