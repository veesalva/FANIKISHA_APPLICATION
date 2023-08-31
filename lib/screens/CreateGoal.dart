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
  final TextEditingController _startdate = TextEditingController();
  final TextEditingController _enddate = TextEditingController();

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
                      controller: _startdate,
                      decoration: const InputDecoration(
                        labelText: "Start Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        setState(() {
                          _startdate.text =
                              DateFormat('dd-MM-yyyy').format(pickeddate!);
                        });
                      }),
                ),
              ),
              const SizedBox(width: 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 120,
                  height: 40,
                  child: TextFormField(
                      controller: _enddate,
                      decoration: const InputDecoration(
                        labelText: "End Date",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      keyboardType: TextInputType.datetime,
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        setState(() {
                          _enddate.text =
                              DateFormat('dd-MM-yyyy').format(pickeddate!);
                          if(_enddate.text != _startdate.text );
                        });
                      }),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
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
          ),
        ],
      ),
    );
  }
}
