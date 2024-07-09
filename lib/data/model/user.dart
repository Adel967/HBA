class User {
  String? id;
  String? name;
  String? image;
  double? rating;
  int? offer;
  User({this.id, this.image, this.name, this.offer, this.rating, });
}

final listUser = [
  User(
    id: 'user1',
    image: 'assets/images/user1.png', 
    name: 'Shiraton',
    offer: 234,
    rating: 5,
  ),
  User(
    id: 'user2',
    image: 'assets/images/user2.png',
    name: 'FourSeason',
    offer: 135,
    rating: 4.5,
  ),
  User(
    id: 'user3',
    image: 'assets/images/user3.png',
    name: 'Khalifa',
    offer: 23,
    rating: 3,
  ),
];
