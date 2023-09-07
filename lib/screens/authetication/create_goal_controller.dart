import 'package:fanikisha_app/models/goal_model.dart';
import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:fanikisha_app/colors/colors.dart'; // custom added colors
import 'package:get/get.dart';

import '../../models/user_model.dart';

class CreateGoalController extends GetxController {
  // static variable instance to be used outside the class
  static CreateGoalController get instance => Get.find();

  final userRepository = Get.put(AutheticationRepository());

  // fields to get data from user
  final goalName = TextEditingController();
  final amount = TextEditingController();
  final goalPriority = TextEditingController();
  final startDate = TextEditingController();
  final endDate = TextEditingController();

  // method to create a goal
  Future<void> createGoal(GoalModel goal) async {
   await AutheticationRepository.instance.saveGoal(goal)
   .then((value) => {print(value)});

  }

}
