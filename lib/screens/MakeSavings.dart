import 'package:fanikisha_app/models/savings_model.dart';
import 'package:fanikisha_app/screens/authetication/savings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/account_model.dart';
import 'authetication/forget_password/authetication_repository.dart';

class MakeSavings extends StatefulWidget {
  MakeSavings({super.key});

  @override
  State<MakeSavings> createState() => _MakeSavingsState();
}

class _MakeSavingsState extends State<MakeSavings> {
  final controller = Get.put(SavingsController());
  final authenticationController = Get.put(AutheticationRepository());
  final controllerAuth = Get.put(AutheticationRepository());
  Map<String, dynamic> dynamicData = {};
  String amountTextError = '';
  bool _isAmountGreater = false;

  // method to save saving in database
  void _saveSavings() {
    Map<String, dynamic> updatedAccountData = {};
    final savings = SavingsModel(
        amount: double.parse(controller.amount.text.trim()),
        date: DateTime.now().toString(),
        accountNumber: controller.account.text.trim());
    // fetch account info to check if the amount saved isn't greater than available
    authenticationController
        .fetchAccountDataByAccountNo(controller.account.text.trim())
        .then((value) => {
              updatedAccountData = value!['data'],
              print(updatedAccountData),
              if (double.parse(
                      updatedAccountData['current_balance'].toString()) >=
                  double.parse(controller.amount.text.trim()))
                {
                  setState(() {
                    _isAmountGreater = false;
                    amountTextError = '';
                  }),
                  controller.saveSavings(savings)
                }
              else
                {
                  setState(() {
                    _isAmountGreater = true;
                    amountTextError = 'The amount is greater than available';
                  })
                }
            });
  }

  // method to fetch savings
  Future<void> fetchData() async {
    // Simulate data fetching delay for 2 seconds (Replace with your data retrieval logic)
    await controllerAuth.fetchDataSavings().then((value) => {
          setState(() {
            dynamicData = value!;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "FANIKISHA",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            ),
            Text(
              "level up your saving habit",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Make Savings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.account,
                          decoration: const InputDecoration(
                            label: Text("Select Account"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.amount,
                          decoration: InputDecoration(
                            label: Text("Enter Amount"),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: _isAmountGreater
                                      ? Colors.red
                                      : Colors
                                          .grey), // Set the border color here
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Text(
                          amountTextError,
                          style: const TextStyle(color: Colors.red),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              _saveSavings();
                            },
                            child: const Text("Save"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Transactions",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dynamicData.length,
              itemBuilder: (BuildContext context, int index) {
                if (index >= 0 && index < dynamicData['data'].length) {
                  SavingsModel savings = SavingsModel.fromJson(
                      dynamicData['data']
                          [index < dynamicData.length ? index : index - 1]);
                  return ListTile(
                    onTap: () {},
                    leading: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                      height: double.infinity,
                      child:
                          const Icon(Icons.save_rounded, color: Colors.white),
                    ),
                    title: const Text("SAVE"),
                    subtitle: Text(savings.date!),
                    trailing: Text(savings.amount.toString()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
