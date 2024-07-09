import 'package:equatable/equatable.dart';

import '../../../../core/enum.dart';

class SearchFilterState extends Equatable {
  final FilterType filterType;
  final String? city;
  final String? roomType;
  final int startPrice;
  final int endPrice;

  const SearchFilterState(
      {this.filterType = FilterType.HOTELS,
      this.city,
      this.roomType,
      this.startPrice = 0,
      this.endPrice = 1000});

  SearchFilterState copyWith({
    FilterType? filterType,
    String? city,
    String? roomType,
    int? startPrice,
    int? endPrice,
  }) {
    return SearchFilterState(
      filterType: filterType ?? this.filterType,
      city: city ?? this.city,
      roomType: roomType ?? this.roomType,
      startPrice: startPrice ?? this.startPrice,
      endPrice: endPrice ?? this.endPrice,
    );
  }

  SearchFilterState copyWithNull({
    FilterType? filterType,
    String? city,
    String? roomType,
    int? startPrice,
    int? endPrice,
  }) {
    return SearchFilterState(
      filterType: filterType ?? FilterType.HOTELS,
      city: city ?? this.city,
      roomType: roomType,
      startPrice: startPrice ?? 0,
      endPrice: endPrice ?? 1000,
    );
  }

  @override
  List<Object?> get props => [
        this.filterType,
        this.city,
        this.roomType,
        this.startPrice,
        this.endPrice
      ];
}
