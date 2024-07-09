import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/model/room_model.dart';
import 'package:meta/meta.dart';

import '../../data/params/search_params.dart';
import '../../data/repository/search_repository.dart';
import '../../injection_container.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final _searchRepo = sl<SearchRepository>();
  SearchParams searchParams = SearchParams();

  search() async {
    emit(SearchLoading());
    //try {
    final res = await _searchRepo.search(searchParams);
    res.fold((l) => emit(RoomsLoaded(rooms: l)),
        (r) => emit(HotelsLoaded(hotels: r)));
    //}
    // catch (e) {
    //   emit(SearchError(error: "There is an error!"));
    // }
  }
}
