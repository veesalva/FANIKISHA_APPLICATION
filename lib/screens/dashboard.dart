import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/create_goal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(AutheticationRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // sign out
                AutheticationRepository.instance.logout();
              },
              child: const Text("Logout"),
            ),
            ElevatedButton(
              onPressed: () {
                // sign out
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CreateGoal();
                    },
                  ),
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
