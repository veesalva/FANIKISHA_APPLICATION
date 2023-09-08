import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  final accountNumber = TextEditingController();
  final accountPin = TextEditingController();

  void signInUser(String email, String password) {
    AutheticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
}
