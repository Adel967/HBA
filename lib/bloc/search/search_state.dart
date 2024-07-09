part of 'search_cubit.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class HotelsLoaded extends SearchState {
  final List<HotelModel> hotels;

  HotelsLoaded({
    required this.hotels,
  });

  @override
  List<Object?> get props => [
        this.hotels,
      ];
}

class RoomsLoaded extends SearchState {
  final List<RoomsModel> rooms;

  RoomsLoaded({
    required this.rooms,
  });

  @override
  List<Object?> get props => [
        this.rooms,
      ];
}

class SearchError extends SearchState {
  final String error;

  SearchError({required this.error});

  @override
  List<Object?> get props => [this.error];
}
