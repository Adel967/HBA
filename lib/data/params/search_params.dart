import '../../../core/enum.dart';

class SearchParams {
  String? title;
  final FilterType filterType;
  final String? city;
  final String? roomType;
  final int? startPrice;
  final int? endPrice;

  SearchParams(
      {this.filterType = FilterType.HOTELS,
      this.city,
      this.title,
      this.roomType,
      this.startPrice,
      this.endPrice});

  @override
  String toString() {
    return 'SearchParams{title: $title, filterType: $filterType, city: $city, roomType: $roomType, startPrice: $startPrice, endPrice: $endPrice}';
  }
}
