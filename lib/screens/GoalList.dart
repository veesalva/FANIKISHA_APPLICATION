import 'package:fanikisha_app/models/goal_model.dart';
import 'package:fanikisha_app/screens/CreateGoal.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/goal.dart';

class GoalList extends StatefulWidget {
  const GoalList({super.key});

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
  bool isLoading = true;
  List<GoalModel> dynamicData = [];

  final controller = Get.put(AutheticationRepository());

  void initState() {
    super.initState();
    fetchData();
    // Fetch initial data when the widget is initialized
  }

  Future<void> fetchData() async {
    // Simulate data fetching delay for 2 seconds (Replace with your data retrieval logic)
    await controller.fetchData().then((value) => {
          setState(() {
            for (int i = 0; i < value!.length; i++) {
              dynamicData[i] = GoalModel.fromJson(value[i]);
            }
            isLoading = false; // Data is now loaded
          })
        });
  }

  @override
  Widget build(BuildContext context) {
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
      body: isLoading
          ? const Center(
              // Display a loading indicator while data is being fetched
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: dynamicData.length,
              itemBuilder: (BuildContext context, int index) {
                return Goal(
                    goalName: dynamicData[index].goalName,
                    goalDuration: dynamicData[index].startDate! +
                        "-" +
                        dynamicData[index].endDate!,
                    goalAmount: dynamicData[index].goalAmount,
                    goalIcon: Icons.shopping_cart,
                    // todo:goalValue logic here
                    goalValue: 100);
              },
            ),
    );
  }
}
