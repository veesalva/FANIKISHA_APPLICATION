import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class ChangeProfileController extends GetxController {
  // static variable instance to be used outside the class
  static ChangeProfileController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // fields to get data from user
  final fullName = TextEditingController();
  final id = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();


  // todo: check if the user exists in the database before u update him/her
  Future<bool> updateUser(UserModel user) async {

    bool isRegistered=false;
    await userRepository.updateUserData(id.text,user.toJson()).then((bool value) =>{
      isRegistered=value
    }) ;
    // check is registered to the database
    if (isRegistered) {
      return true;
    }
    print(isRegistered);
    return false;
  }

}
