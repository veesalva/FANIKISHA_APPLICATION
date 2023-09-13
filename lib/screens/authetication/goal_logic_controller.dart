import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:get/get.dart';

class GoalLogicController extends GetxController {
  static GoalLogicController get instance => Get.find();

  final controller = Get.put(AutheticationRepository());
  Map<String, dynamic>? goalData = {};

  // priority weights
  List<dynamic> priorityWeight = [];

  // duration weights
  List<dynamic> durationWeight = [];

  // priority*duration weights
  List<dynamic> pDWeight = [];

  // total of all amount per day
  double totalAmountPerDay=0;

  // total of all amount per day
  double pdWeightTotal=0;

  Future<void> goalLogic() async {
    await controller.fetchData().then((value) => {goalData = value});
    List<dynamic> goals = goalData?['data'];

    Map<String, dynamic> highestPriorityGoal;
    int highestPriority = -1; // Initialize with a lower value than any priority

    // Loop over the list of goals to find the highest priority
    for (var goal in goals) {
      if (goal["priority"] > highestPriority) {
        highestPriority = goal["goal_priority"];
      }
    }

    // finding the priority weight
    priorityWeight = goals
        .map((goal) =>
            double.parse(goal["goal_priority"].toString()) /
            highestPriority.toDouble())
        .toList();

  //   finding total amount per day
    goals.forEach((goal) {
      totalAmountPerDay += goal["amount_per_day"];
    });

    // finding the priority weight
    durationWeight = goals
        .map((goal) =>
    double.parse(goal["amount_per_day"].toString()) /
        totalAmountPerDay)
        .toList();

    // multiply priorityWeight and durationWeight
    for (int i = 0; i < priorityWeight.length; i++) {
      pDWeight.add(priorityWeight[i] * durationWeight[i]);
    }

  //   pdWeights total
    for (double value in pDWeight) {
      pdWeightTotal += value;
    }
  }





//
}
