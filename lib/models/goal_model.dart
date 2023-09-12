import 'package:intl/intl.dart';

class GoalModel {
   String? goalId;
   String? userId;
   String? goalName;
   String? goalType;
   String? goalAmount;
   String? paymentNumber;
   String? goalPriority;
   String? startDate;
   String? endDate;
   String? goalPercent;

  GoalModel(
      {required this.userId,
        required this.goalType,
        required this.goalAmount,
        required this.paymentNumber,
        required this.goalPriority,
        required this.startDate,
        required this.endDate,
        this.goalId,
        required this.goalName});

  toJson() {
    return {
      "user_id": userId,
      "goal_name": goalName,
      "amount": goalAmount,
      "goal_priority": goalPriority,
      // todo change percent logic here
      "goal_percent": '12%',
      "start_date": startDate,
      "end_date": endDate,
    };
  }

  GoalModel.fromJson(Map<String, dynamic> json) {
    goalId = json['goal_id'].toString();
    userId = json['user_id'].toString();
    goalName = json['goal_name'];
    goalAmount = json['amount'];
    goalPriority = json['goal_priority'];
    goalPercent = json['goal_percent'];
    startDate =  DateFormat('yyyy-MM-dd').format(DateTime.parse(json['start_date'])).toString();
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(json['end_date'])).toString();
  }
}