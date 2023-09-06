import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  bool _isAutheticated=false;
  Future<void> signInUser(String email, String password) async {

    await AutheticationRepository.instance
        .loginWithEmailAndPassword(email, password);
  }

  bool isUserAuthenticated(){
    print(_isAutheticated);
    return _isAutheticated;
  }
}
