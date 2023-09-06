import 'package:fanikisha_app/screens/payment_invoice.dart';
import 'package:flutter/material.dart';

class GoalDetails extends StatefulWidget {
  const GoalDetails({super.key});

  @override
  State<GoalDetails> createState() => _GoalDetailsState();
}

class _GoalDetailsState extends State<GoalDetails> {
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
      body: ListView(
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
            child: const ListTile(
              leading: Text("GOAL"),
              trailing: Text("Food Shopping"),
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
            child: const ListTile(
              leading: Text("GOAL AMOUNT"),
              trailing: Text("54000TZS"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
            child: const ListTile(
              leading: Text(" AMOUNT PAID"),
              trailing: Text("50000TZS"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
            child: const ListTile(
              leading: Text("AMOUNT REMAING"),
              trailing: Text("4000TZS"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 20, 0),
            child: const ListTile(
              leading: Text("TIME SPAN"),
              trailing: Text("18/08/23 - 18/10/23"),
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
}
