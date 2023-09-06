import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<bool> signInUser(String email, String password) async {
    bool isAutheticated=false;
    await AutheticationRepository.instance
        .loginWithEmailAndPassword(email, password)
        .then((value) =>{
          print(value)
    });
    return isAutheticated;
  }
}
