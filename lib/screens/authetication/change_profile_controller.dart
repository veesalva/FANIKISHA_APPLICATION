import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';

class ChangeProfileController extends GetxController {
  // static variable instance to be used outside the class
  static ChangeProfileController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  // fields to get data from user
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();

}
