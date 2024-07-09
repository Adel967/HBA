part of 'book_room_cubit.dart';

@immutable
abstract class BookRoomState extends Equatable {}

class BookRoomInitial extends BookRoomState {
  @override
  List<Object?> get props => [];
}

class BookRoomLoading extends BookRoomState {
  @override
  List<Object?> get props => [];
}

class BookRoomLoaded extends BookRoomState {
  @override
  List<Object?> get props => [];
}

class BookRoomChecked extends BookRoomState {
  @override
  List<Object?> get props => [];
}

class BookRoomError extends BookRoomState {
  final String error;

  BookRoomError({required this.error});

  @override
  List<Object?> get props => [this.error];
}
