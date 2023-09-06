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
<<<<<<< Updated upstream
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "Password": password,
      "BankAccountNumber": bankAccountNumber,
=======
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
>>>>>>> Stashed changes
    };
  }

//   convert snapshot to user model
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],
        bankAccountNumber: data["BankAccountNumber"],
        phoneNumber: data["PhoneNumber"]);
  }
}
