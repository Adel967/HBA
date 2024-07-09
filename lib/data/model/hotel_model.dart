import 'package:cloud_firestore/cloud_firestore.dart';

List<HotelModel> getHotelListFromListMap(List<QueryDocumentSnapshot> list) =>
    List<HotelModel>.from(
        list.map((x) => HotelModel.fromQueryDocumentSnapshot(x)));

class HotelModel {
  String? hotelsId;
  String? hotelsName;
  String? address;
  double? rating;
  String? hotelsNameAr;
  String? hotelsImage;
  List<String>? imagesUrl;
  String? description;

  HotelModel(
      {this.hotelsId,
      this.hotelsName,
      this.address,
      this.rating,
      this.hotelsNameAr,
      this.description,
      this.hotelsImage});

  HotelModel.fromJson(Map<String, dynamic> json) {
    hotelsName = json['name'];
    address = json['address'];
    rating = json['rating'] is int ? json['rating'].toDouble() : json['rating'];
    hotelsNameAr = json['name'];
    imagesUrl = List<String>.from(json['imagesUrl']);
    hotelsImage = json['imagesUrl'][0];
    description = json['description'];
  }

  HotelModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot json) {
    print("parse");
    print(json.data());
    hotelsId = json.id;
    hotelsName = json['name'];
    address = json['address'];
    rating = json['rating'] is int ? json['rating'].toDouble() : json['rating'];
    hotelsNameAr = json['name'];
    imagesUrl = List<String>.from(json['imagesUrl']);
    hotelsImage = json['imagesUrl'][0];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotels_id'] = hotelsId;
    data['hotels_name'] = hotelsName;
    data['address'] = address;
    data['rating'] = rating;
    data['hotels_name_ar'] = hotelsNameAr;
    data['hotels_image'] = hotelsImage;
    return data;
  }

  @override
  String toString() {
    return 'HotelModel{hotelsId: $hotelsId, hotelsName: $hotelsName, address: $address, rating: $rating, hotelsNameAr: $hotelsNameAr, hotelsImage: $hotelsImage, imagesUrl: $imagesUrl, description: $description}';
  }
}
