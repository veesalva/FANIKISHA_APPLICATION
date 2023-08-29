import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';

class GoalList extends StatefulWidget {
  const GoalList({super.key});

  @override
  State<GoalList> createState() => _GoalListState();
}

class _GoalListState extends State<GoalList> {
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

        },
        child:const Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20,70,20,10),
            child: const Text(
              "Goals",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          const Goal(
              goalName: "Food Shopping",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.shopping_cart,
              goalValue: 50),
          const Goal(
              goalName: "Bundle Payment",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.wifi,
              goalValue: 80),
          const Goal(
              goalName: "Health Insurance",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.health_and_safety,
              goalValue: 30),
          const Goal(
              goalName: "Food Shopping",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.shopping_cart,
              goalValue: 50),
          const Goal(
              goalName: "Food Shopping",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.shopping_cart,
              goalValue: 100),
          const Goal(
              goalName: "Food Shopping",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.shopping_cart,
              goalValue: 50),
          const Goal(
              goalName: "Food Shopping",
              goalDuration: "18/08/2023 - 18/10/2023",
              goalAmount: "TZS 4,000",
              goalIcon: Icons.shopping_cart,
              goalValue: 100),
        ],
      ),
    );
  }
}

class Goal extends StatelessWidget {
  const Goal(
      {super.key,
      required this.goalName,
      required this.goalDuration,
      required this.goalAmount,
      required this.goalIcon,
      required this.goalValue});

  final String goalName;
  final String goalDuration;
  final String goalAmount;
  final IconData goalIcon;
  final int goalValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {

            },
            leading: Container(
              height: double.infinity,
              child:  Icon(goalIcon, color:goalValue!=100? Colors.red:Colors.green),
            ),
            title: Text(goalName),
            subtitle: Column(
              children: [
                Text(goalDuration),

              ],
            ),
            trailing: Text(goalAmount),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(28, 5, 10, 5),
          child: LinearProgressIndicator(
            value: goalValue / 100,
          ),
        )
      ],
    );
  }
}
