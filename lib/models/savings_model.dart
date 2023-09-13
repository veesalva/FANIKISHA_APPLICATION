import 'package:intl/intl.dart';

class SavingsModel {
  int? savingsId;
  double? amount;
  String? date;
  String? accountNumber;

  SavingsModel(
      {this.savingsId,
      required this.amount,
      required this.date,
      required this.accountNumber});

  SavingsModel.fromJson(Map<String, dynamic> json) {
    savingsId = json['savings_id'];
    amount = double.parse(json['amount'].toString());
    date = DateFormat('yyyy-MM-dd').format(DateTime.parse(json['date'])).toString();
    accountNumber = json['account_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['savings_id'] = this.savingsId;
    data['amount'] = this.amount;
    data['date'] = this.date;
    data['account_number'] = this.accountNumber;
    return data;
  }
}
