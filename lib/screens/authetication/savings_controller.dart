import 'package:fanikisha_app/models/savings_model.dart';
import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../models/account_model.dart';
import '../../models/user_model.dart';

class SavingsController extends GetxController {
  // static variable instance to be used outside the class
  static SavingsController get instance => Get.find();

  final controller = Get.put(AutheticationRepository());

  final userRepository = Get.put(UserRepository());

  // fields to get data from user
  final account = TextEditingController();
  final amount = TextEditingController();

  Future<void> saveSavings(SavingsModel savingsModel) async {
      Map<String, dynamic> updatedAccountData={};
    await controller.saveSavings(savingsModel);
    await controller
        .fetchAccountDataByAccountNo(savingsModel.accountNumber.toString())
        .then((value) => {
          updatedAccountData=value?['data']
    });
     var accountData=AccountModel.fromJson(updatedAccountData);
     // minus current_balance by amount of savings done
     double currentBalance=double.parse(accountData.currentBalance!)-savingsModel.amount!;
     accountData.currentBalance=currentBalance.toString();
     updatedAccountData=accountData.toJson();
    await controller.updateAccountData(account.text.trim(), updatedAccountData);
  }
}
