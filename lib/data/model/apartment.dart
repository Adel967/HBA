import 'user.dart';

class Apartment {
  String? id;
  String? title;
  String? image;
  String? location;
  String? description;
  double? rating;
  int? price;
  String? type;
  int? users;
  List<String>? facilities;
  User? owner;

  Apartment({
    this.description,
    this.facilities,
    this.id,
    this.image,
    this.location,
    this.owner,
    this.price,
    this.rating,
    this.title,
    this.type,
    this.users,
  });
}

final listApartmentTop = [
  Apartment(
    description:
    "The Best room you could probably dream of is ready for you to book.it has the most fabulos look.",
    facilities: ['2 person', '1 Toilet', '1 Kitchen'],
    id: 'apartment4',
    image: 'assets/images/apartment4.jfif',
    location: 'Damascus,Syria',
    owner: listUser[1],
    price: 180,
    rating: 4.8,
    title: 'Dream Room',
    type: 'Hot this month',
    users: 53,
  ),
  Apartment(
    description:
        "if you're tired and just want to be alone and get some sleep ..this is the perfect place for you with the best price.",
    facilities: ['1 Money Safe', '1 Tv', '1 Bed', '1 room'],
    id: 'apartment1',
    image: 'assets/images/apartment1.jfif',
    location: 'Tokyo ,Japan',
    owner: listUser[0],
    price: 45,
    rating: 4,
    title: 'Your Capsule',
    type: 'Best Deal',
    users: 120,
  ),
  Apartment(
    description:
        "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
    facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
    id: 'apartment2',
    image: 'assets/images/apartment2.jfif',
    location: 'Garut, Indonesia',
    owner: listUser[1],
    price: 173,
    rating: 4.5,
    title: 'Babakan Seungit',
    type: 'Great Place',
    users: 40,
  ),
  Apartment(
    description:
    "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
    facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
    id: 'apartment3',
    image: 'assets/images/apartment3.jfif',
    location: 'Bandung, Indonesia',
    owner: listUser[2],
    price: 221,
    rating: 4.5,
    title: 'Valley Mount',
    type: 'Pure',
    users: 39,
  ),

];



final listApartmentNear = [
  Apartment(
    description:
        "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
    facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
    id: 'apartment3',
    image: 'assets/images/apartment3.jfif',
    location: 'Bandung, Indonesia',
    owner: listUser[2],
    price: 221,
    rating: 4.5,
    title: 'Valley Mount',
    type: 'Pure',
    users: 39,
  ),
  Apartment(
    description:
        "An apartment is a private residence in a building or house that's divided into several separate dwellings. An apartment can be one small room or several. An apartment is a flat — it's usually a few rooms that you rent in a building.",
    facilities: ['2 Bedrooms', '1 Toilet', '1 Living Room', '1 Kitchen'],
    id: 'apartment4',
    image: 'assets/images/apartment4.jfif',
    location: 'Garut, Indonesia',
    owner: listUser[1],
    price: 180,
    rating: 4.5,
    title: 'Loa Uhuy',
    type: 'Pure',
    users: 21,
  ),

];
