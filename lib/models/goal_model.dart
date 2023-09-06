class GoalModel {
  final String? goalId;
  final String userId;
  final String goalName;
  final String goalType;
  final String goalAmount;
  final String paymentNumber;
  final String goalPriority;
  final String startDate;
  final String endDate;

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
}
