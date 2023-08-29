import 'package:flutter/material.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "FANIKISHA",
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            Text("level your savings")
          ],
        ),
      ),
      body: ListView(
        children:  [
          const SizedBox(
            height: 20,
          ),
          Container(margin: EdgeInsets.all(20),
            child: const Text(
              "Goal Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

        ],
      ),
    );
  }
}
