import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
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
        child: Container(
          width: 330, // Adjust the width of the container as per your requirements
          height: 10, // Adjust the height of the container as per your requirements
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Rounded corners
            color: Colors.green, // Green box color
          ),
          child: const LinearProgressIndicator(
            backgroundColor: Colors.white, // Background color of the progress bar
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green), // Color of the progress bar
            value: 0.5, // Set the progress value between 0.0 and 1.0
          ),
        ),
      ),
    );
  }
}
