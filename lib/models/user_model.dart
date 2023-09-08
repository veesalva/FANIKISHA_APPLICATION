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
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "user_type": "user"
    };
  }

//   convert snapshot to user model
  factory UserModel.fromSnapshot(Map<String, dynamic> userData) {
    final data = userData;
    return UserModel(
        fullName: data["fullName"],
        email: data["email"],
        password: data["password"],
        phoneNumber: data["phoneNumber"]);
  }
}
