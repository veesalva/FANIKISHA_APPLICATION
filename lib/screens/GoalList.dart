import 'package:fanikisha_app/models/goal_model.dart';
import 'package:fanikisha_app/screens/CreateGoal.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/goal.dart';

class GoalList extends StatefulWidget {
  const GoalList({super.key});

  // todo: while creating goal null exception
  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  Map<String, dynamic> dynamicData = {};

  final controller = Get.put(AutheticationRepository());
  bool isLoading = true;

  void initState() {
    super.initState();
    fetchData();
    // Fetch initial data when the widget is initialized
  }

  Future<void> fetchData() async {
    try {
      final data = await controller.fetchData();
      setState(() {
        dynamicData = data ?? {}; // Set dynamicData to fetched data or an empty map if null
        isLoading = false; // Data fetching is complete
      });
    } catch (error) {
      print("Error fetching data: $error");
      setState(() {
        isLoading = true; // Data fetching failed
      });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CreateGoal();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: isLoading // Check if data is still loading
          ? const Center(
              child: CircularProgressIndicator(), // Display a loading indicator
            )
          : ListView.builder(
              itemCount: dynamicData['data'].length,
              itemBuilder: (BuildContext context, int index) {
                GoalModel goal = GoalModel.fromJson(dynamicData['data'][index]);
                return Goal(
                    goalName: goal.goalName,
                    goalDuration: goal.startDate! + "-" + goal.endDate!,
                    goalAmount: goal.goalAmount,
                    goalIcon: Icons.shopping_cart,
                    // todo:goalValue logic here
                    goalValue: 100);
              },
            ),
    );
  }
}
