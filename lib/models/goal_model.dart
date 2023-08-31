class GoalModel {
  final String? id;
  final String goalName;
  final String goalType;
  final String goalAmount;
  final String paymentNumber;
  final String goalPriority;
  final String startDate;
  final String endDate;

  GoalModel(
      this.id,
      this.goalName,
      this.goalType,
      this.goalAmount,
      this.paymentNumber,
      this.goalPriority,
      this.startDate,
      this.endDate
      );


  toJson() {
    return {
      "GoalName": goalName,
      "GoalAmount": goalAmount,
      "GoalType": goalType,
      "PaymentNumber": paymentNumber,
      "GoalPriority": goalPriority,
      "StartDate": startDate,
      "EndDate": endDate,
    };
  }
}
