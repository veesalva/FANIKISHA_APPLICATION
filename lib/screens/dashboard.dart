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
            Container(
              width: 200, // Adjust the width of the container as per your requirements
              height: 80, // Adjust the height of the container as per your requirements
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Rounded corners
                color: Colors.green, // Green box color
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.white, // Background color of the progress bar
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Color of the progress bar
                    value: 0.5, // Set the progress value between 0.0 and 1.0
                  ),
                  SizedBox(height: 5), // Add some spacing between the progress bar and the text
                  Text(
                    'Shopping',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Add some spacing between the text and the percentage
                  Text(
                    '50%', // Replace with the actual progress percentage
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
