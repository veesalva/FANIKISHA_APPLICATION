import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/authetication/logged_user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fanikisha_app/colors/colors.dart'; // custom added colors
import '../widgets/bank_card.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final controller = Get.put(AutheticationRepository());
  final userController = Get.put(LoggedUserDataController());
  bool _isAccountAdded = false;
  List<dynamic> accountData = [];
  String? accountHolder;

  @override
  void initState() {
    super.initState();
    _fetchAccountData();
  }

  // method to fetch user
  void _fetchUser() {
    // print(userController.getUserData());
    userController.getUserData().then(
          (value) => {
            setState(
              () => accountHolder=value!['fullName'],
            )
          },
        );
  }

  // method to fetch account data
  void _fetchAccountData() {
    controller.fetchAccountData().then((value) => {
          if (value!.isNotEmpty)
            {
              setState(() {
                _isAccountAdded = true;
                accountData = value['data'];
                // print(accountData[0]['actual_balance']);
              }),
              _fetchUser()
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    _fetchAccountData();
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
          BankCard(
            cardHolder:_isAccountAdded?accountHolder!: "Unknown",
            bankAccountNumber: _isAccountAdded
                ? accountData[0]['account_number']
                : '**** **** **** **** ',
            isAccountAdded: _isAccountAdded,
          ),
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
                  "50000",
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
              tileColor: AppColors.accentColor,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 70 / 100,
              ),
              subtitle: const Text("Shopping", style: TextStyle(color: Colors.white)),
              trailing: const Text("53%", style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              onTap: () {},
              tileColor: AppColors.accentColor,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.electric_bolt_rounded, color: Colors.white),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 53 / 100,
              ),
              subtitle: const Text("Electronics", style: TextStyle(color: Colors.white)),
              trailing: const Text(
                "53%",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              onTap: () {},
              tileColor: AppColors.accentColor,
              leading: Container(
                height: double.infinity,
                child: const Icon(Icons.shopping_cart, color: Colors.white),
              ),
              title: const LinearProgressIndicator(
                minHeight: 8,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                value: 53 / 100,
              ),
              subtitle: const Text("Shopping", style: TextStyle(color: Colors.white)),
              trailing: const Text(
                "53%",
                style: TextStyle(fontSize: 20, color: Colors.white),
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
