import '../../core/enum.dart';

class UserModel {
  String? id;
  String? email;
  String? userName;
  String? phoneNumber;
  String? birthDate;
  Gender? gender;
  String? createdAt;
  String? pushToken;

  UserModel(
      {required this.id,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.birthDate,
      required this.gender,
      required this.createdAt,
      required this.pushToken});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'email': this.email,
      'userName': this.userName,
      'phoneNumber': this.phoneNumber,
      'birthDate': this.birthDate,
      'gender': genderToString(this.gender!),
      'createdAt': this.createdAt,
      'pushToken': this.pushToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      userName: map['userName'],
      phoneNumber: map['phoneNumber'],
      birthDate: map['birthDate'],
      gender: stringToGender(map['gender']),
      createdAt: map['createdAt'],
      pushToken: map['pushToken'],
    );
  }
}
