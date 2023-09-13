import 'package:fanikisha_app/screens/payment_invoice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/goal_model.dart';
import 'authetication/forget_password/authetication_repository.dart';

class GoalDetails extends StatefulWidget {
  GoalDetails({super.key, required this.goalIndex});

  final int? goalIndex;

  @override
  State<GoalDetails> createState() => _GoalDetailsState();
}

class _GoalDetailsState extends State<GoalDetails> {
  Map<String, dynamic> dynamicData = {};
  GoalModel? goal;
  bool _isLoading = true;
  final controller = Get.put(AutheticationRepository());

  Future<void> fetchData() async {
    try {
      final data = await controller.fetchData();
      dynamicData = data ?? {};
      goal = GoalModel.fromJson(dynamicData['data'][widget.goalIndex]);
      setState(() {
        _isLoading = false;
      });

    } catch (error) {
      print("Error fetching data: $error");
    }
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
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(), // Display a loading indicator
            )
          : ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "Goal Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: ListTile(
                    leading: Text("GOAL"),
                    trailing: Text(goal!.goalName!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: const ListTile(
                    leading: Text("GOAL TYPE"),
                    trailing: Text("Purchase"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: ListTile(
                    leading: Text("GOAL AMOUNT"),
                    trailing: Text(goal!.goalAmount!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: ListTile(
                    leading: Text(" AMOUNT PAID"),
                    trailing: Text(goal!.currentBalance!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: ListTile(
                    leading: Text("AMOUNT REMAING"),
                    trailing: Text((double.parse(goal!.goalAmount!) -
                            double.parse(goal!.currentBalance!))
                        .toString()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: ListTile(
                    leading: Text("TIME SPAN"),
                    trailing: Text("${goal!.startDate!} - ${goal!.endDate!}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
                  child: const ListTile(
                    leading: Text("PAYMENT NUMBER"),
                    trailing: Text("0755497834"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentInvoice(),
                        ),
                      );
                    },
                    child: Text("Make Payment"),
                  ),
                )
              ],
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }
}
