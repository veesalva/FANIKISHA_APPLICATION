import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanikisha_app/models/user_model.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/otp_screen.dart';
import 'package:get/get.dart';

// this is to perform database  operations on the user
class UserRepository extends GetxController {
 /* static UserRepository get instance => Get.find();

//   database instance
  final _db = FirebaseFirestore.instance;

// create user in the database

  createUser(UserModel user) async {
    await _db.collection("users").add(user.toJson()).whenComplete(() {
      Get.snackbar(
        "Success",
        "Your Account has been created",
        snackPosition: SnackPosition.BOTTOM,
      );
      // redirect to otp screen
      Get.to(OTPScreen());
    }).catchError(
      (error, stackTrace) {
        Get.snackbar(
          "Error",
          "Something went wrong",
          snackPosition: SnackPosition.BOTTOM,
        );
        print(error.toString());
      },
    );
  }

//   get one user details from database
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  //   get all users details from database
  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db.collection("users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }*/


}
