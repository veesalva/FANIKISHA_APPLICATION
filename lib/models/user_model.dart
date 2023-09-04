import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;
  final String bankAccountNumber;
  final String phoneNumber;

  const UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.password,
      required this.bankAccountNumber,
      required this.phoneNumber});

  // convert user model to snapshot
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Password": password,
      "BankAccountNumber": bankAccountNumber,
    };
  }

//   convert snapshot to user model
  factory UserModel.fromSnapshot(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        fullName: json["FullName"],
        email: json["Email"],
        password: json["Password"],
        bankAccountNumber: json["BankAccountNumber"],
        phoneNumber: json["PhoneNumber"]);
  }


}
