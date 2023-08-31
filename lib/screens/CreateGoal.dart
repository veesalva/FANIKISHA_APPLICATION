import 'package:date_field/date_field.dart';
import 'package:fanikisha_app/screens/saving_plan_options.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum GoalPriorityEnum { High, Medium, Low }

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  GoalPriorityEnum? _goalPriorityEnum;

  // field for selected dates from an to
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();

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
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.green,
              ),
            ),
            Text(
              "Level up your saving habit",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: const Text(
            "Goal Description",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Goal Name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Goal Type",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Payment Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: const Text(
            "Goal Priority",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: RadioListTile<GoalPriorityEnum>(
                  hoverColor: Colors.green,
                  activeColor: Colors.green,
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  value: GoalPriorityEnum.High,
                  groupValue: _goalPriorityEnum,
                  dense: true,
                  title: Text(
                    GoalPriorityEnum.High.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _goalPriorityEnum = val;
                    });
                  }),
            ),
            Expanded(
              child: RadioListTile<GoalPriorityEnum>(
                  hoverColor: Colors.green,
                  activeColor: Colors.green,
                  contentPadding: const EdgeInsets.only(left: 4.0),
                  value: GoalPriorityEnum.Medium,
                  groupValue: _goalPriorityEnum,
                  dense: true,
                  title: Text(
                    GoalPriorityEnum.Medium.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _goalPriorityEnum = val;
                    });
                  }),
            ),
            Expanded(
              child: RadioListTile<GoalPriorityEnum>(
                  hoverColor: Colors.green,
                  activeColor: Colors.green,
                  contentPadding: const EdgeInsets.only(left: 2.0),
                  value: GoalPriorityEnum.Low,
                  groupValue: _goalPriorityEnum,
                  dense: true,
                  title: Text(
                    GoalPriorityEnum.Low.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _goalPriorityEnum = val;
                    });
                  }),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(12),
          child: const Text(
            "Goal Duration",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("From"),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: DateTimeField(
                    onDateSelected: (value) {
                      setState(() {
                        fromSelectedDate = value;
                      });
                    },
                    selectedDate: fromSelectedDate),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("To"),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(

                ),
                child: DateTimeField(
                    onDateSelected: (value) {
                      setState(() {
                        toSelectedDate = value;
                      });
                    },
                    selectedDate: toSelectedDate),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(60.0),
          child: SizedBox(
            width: 26,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SavingPlanOptions(),
                    ));
              },
              child: const Text("ADD GOAL"),
            ),
          ),
        )
      ]),
    );
  }
}
