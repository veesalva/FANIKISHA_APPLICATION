import 'package:fanikisha_app/models/account_model.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  final accountNumber = TextEditingController();
  final accountPin = TextEditingController();

  void saveAccountInfo(AccountModel accountModel) {
    AutheticationRepository.instance.saveAccount(accountModel);
  }
}
