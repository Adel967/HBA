import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hba/data/model/hotel_model.dart';
import 'package:hba/data/model/room_model.dart';

List<BookedRoom> getBookedRoomsListFromListMap(
        List<QueryDocumentSnapshot> list) =>
    List<BookedRoom>.from(
        list.map((x) => BookedRoom.fromQueryDocumentSnapshot(x)));

class BookedRoom {
  final String? id;
  final String? roomId;
  final String? hotelId;
  RoomsModel? room;
  HotelModel? hotel;
  final DateTime? startDate;
  final DateTime? bookedDate;
  final int? nightsCount;
  final int? totalPrice;

  BookedRoom(
      {this.id,
      this.room,
      this.hotel,
      required this.roomId,
      required this.hotelId,
      required this.startDate,
      required this.nightsCount,
      this.totalPrice,
      required this.bookedDate});

  Map<String, dynamic> toMap() {
    return {
      'roomId': this.roomId,
      'hotelId': this.hotelId,
      'startDate': this.startDate,
      'bookedDate': this.bookedDate,
      'nightsCount': this.nightsCount,
      'totalPrice': this.totalPrice,
      'userId': FirebaseAuth.instance.currentUser!.uid,
    };
  }

  factory BookedRoom.fromMap(Map<String, dynamic> map) {
    return BookedRoom(
      id: map['id'] as String,
      roomId: map['roomId'] as String,
      hotelId: map['hotelId'] as String,
      startDate: map['startDate'] as DateTime,
      bookedDate: map['bookedDate'] as DateTime,
      nightsCount: map['nightsCount'] as int,
    );
  }

  factory BookedRoom.fromQueryDocumentSnapshot(QueryDocumentSnapshot map) {
    return BookedRoom(
        id: map.id,
        roomId: map['roomId'],
        hotelId: map['hotelId'],
        startDate: map['startDate'].toDate(),
        bookedDate: map['bookedDate'].toDate(),
        nightsCount: map['nightsCount'],
        totalPrice: map['totalPrice']);
  }
}
