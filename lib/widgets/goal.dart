
import 'package:flutter/material.dart';

import '../screens/goaldetails.dart';


class Goal extends StatelessWidget {
  const Goal({super.key,
    required this.goalName,
    required this.goalDuration,
    required this.goalAmount,
    required this.goalIcon,
    required this.goalValue});

  final String? goalName;
  final String? goalDuration;
  final String? goalAmount;
  final IconData? goalIcon;
  final int? goalValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const GoalDetails();
                  },
                ),
              );
            },
            leading: Container(
              height: double.infinity,
              child: Icon(goalIcon,
                  color: goalValue != 100 ? Colors.red : Colors.green),
            ),
            title: Text(goalName!),
            subtitle: Column(
              children: [
                Text(goalDuration!),
              ],
            ),
            trailing: Text(goalAmount!),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(28, 5, 10, 5),
          child: LinearProgressIndicator(
            value: goalValue! / 100,
          ),
        )
      ],
    );
  }
}