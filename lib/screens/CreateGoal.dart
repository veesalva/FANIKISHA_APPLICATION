import 'package:fanikisha_app/models/goal_model.dart';
import 'package:fanikisha_app/screens/authetication/create_goal_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum GoalPriorityEnum { High, Medium, Low }

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> {
  GoalPriorityEnum? _goalPriorityEnum;
  DateTime? selectedEndDate;
  DateTime? selectedStartDate;
  final controller = Get.put(CreateGoalController());

  // field for selected dates from an to
  DateTime fromSelectedDate = DateTime.now();
  DateTime toSelectedDate = DateTime.now();

  void _saveGoal(BuildContext context) async {
    controller.goalPriority.text = _goalPriorityEnum.toString().split('.')[1];
    final goal = GoalModel(
        userId: "1",
        goalType: "food",
        goalAmount: controller.amount.text.trim(),
        paymentNumber: "09748127981",
        goalPriority: controller.goalPriority.text.trim(),
        startDate: controller.startDate.text.trim(),
        endDate: controller.endDate.text.trim(),
        goalName: controller.goalName.text.trim());

    await controller.createGoal(goal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "FANIKISHA",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            Text(
              "Level up your saving habit",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
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
            padding: const EdgeInsets.all(8.0),
            child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.goalName,
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
                      controller: controller.amount,
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
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'From:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 180),
                Column(
                  children: [
                    Text(
                      'To:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: TextFormField(
                    controller: controller.startDate,
                    decoration: const InputDecoration(
                      labelText: "Start Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          selectedStartDate = pickedDate;
                          controller.startDate.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format the date as needed
                        });
                      }
                    },),
                ),
              ),
              const SizedBox(width: 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: TextFormField(
                    controller: controller.endDate,
                    decoration: const InputDecoration(
                      labelText: "End Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.datetime,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          selectedEndDate = pickedDate;
                          controller.endDate.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format the date as needed
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(70.0),
            child: SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  _saveGoal(context);
                },
                child: const Text("ADD GOAL"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}