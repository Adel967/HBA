import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hba/core/enum.dart';
import 'package:hba/view/screen/home/filters/search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  SearchFilterCubit() : super(const SearchFilterState());

  onChangeFilterData({String? city, roomType, int? startPrice, endPrice}) {
    emit(state.copyWith(
        city: city,
        roomType: roomType,
        startPrice: startPrice,
        endPrice: endPrice));
  }

  onChangeFilterType(FilterType filterType) {
    emit(state.copyWithNull(filterType: filterType));
  }

  resetFilterData() {
    emit(SearchFilterState());
  }
}
