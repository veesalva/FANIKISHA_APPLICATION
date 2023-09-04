import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class SignUpController extends GetxController {
  // static variable instance to be used outside the class
  static SignUpController get instance => Get.find();

  final userRepository=Get.put(UserRepository());

  // fields to get data from user
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repeatPassword = TextEditingController();
  final phoneNumber = TextEditingController();
  final bankAccountNumber = TextEditingController();

  // function to register the user this will be called from the design
  void registerUser(String email, String password) {
    AutheticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  void phoneNumberAuthentication(String phoneNumber) {
    AutheticationRepository.instance.phoneAuthetication(phoneNumber);
  }

  Future<void> createUser(UserModel user) async {
   // await  userRepository.createUser(user);
   phoneNumberAuthentication(user.phoneNumber);
   registerUser(user.email, user.password);
  }
}
