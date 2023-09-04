import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String phoneNumber;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phoneNumber});

  // convert user model to snapshot
  toJson() {
    return {
      "fullname": fullName,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
    };
  }

//   convert snapshot to user model
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],
        phoneNumber: data["PhoneNumber"]);
  }


}
