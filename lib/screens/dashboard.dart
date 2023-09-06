import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/bank_card.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(AutheticationRepository());

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
          BankCard(cardHolder: "**** ****",bankAccountNumber: "***** ***** ***** ****",isAccountAdded: false),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "50000",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Current Balance",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "50000",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Income",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "50000",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Outcome",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(28, 20, 10, 5),
            child: const LinearProgressIndicator(
              minHeight: 8,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              value: 50 / 100,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(22, 5, 13, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weekly payment limit",
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                Text(
                  "50000/60000",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: [
                Icon(Icons.save_rounded),
                Text("Save"),
                Spacer(),
                Icon(Icons.next_plan_rounded),
                Text("Choose Plan"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: const Text(
              "Usage Statistics",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              onTap: () {},
              tileColor: Colors.grey.shade400,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.shopping_cart),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 70 / 100,
              ),
              subtitle: const Text("Shopping"),
              trailing: const Text(
                "53%",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              onTap: () {},
              tileColor: Colors.grey.shade400,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.electric_bolt_rounded),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 53 / 100,
              ),
              subtitle: const Text("Electronics"),
              trailing: const Text(
                "53%",
                style: TextStyle(fontSize: 20),
              ),
            ),

          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              onTap: () {},
              tileColor: Colors.grey.shade400,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.shopping_cart),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 53 / 100,
              ),
              subtitle: const Text("Shopping"),
              trailing: const Text(
                "53%",
                style: TextStyle(fontSize: 20),
              ),
            ),


          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
