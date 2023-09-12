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
    goalId = json['goal_id'];
    userId = json['user_id'];
    goalName = json['goal_name'];
    goalAmount = json['amount'];
    goalPriority = json['goal_priority'];
    goalPercent = json['goal_percent'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }
}