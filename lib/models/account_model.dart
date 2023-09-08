class AccountModel {
  String? userId;
  String? accountNumber;
  String? accountPin;
  String? actualBalance;
  String? currentBalance;

  AccountModel(
      {required this.userId,
      required this.accountNumber,
      this.actualBalance,
      this.currentBalance,
      required this.accountPin});

  AccountModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    accountNumber = json['account_number'];
    actualBalance = json['actual_balance'];
    currentBalance = json['current_balance'];
    accountPin = json['account_pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['account_number'] = this.accountNumber;
    data['actual_balance'] = this.actualBalance;
    data['current_balance'] = this.currentBalance;
    return data;
  }
}
