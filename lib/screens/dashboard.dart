import 'package:fanikisha_app/repository/user_repository.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class DashboardPage extends StatelessWidget {
   DashboardPage({super.key});

  final controller = Get.put(UserRepository());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: UserRepository.instance.getAllUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final users = snapshot.data;

            return ListView.builder(
              itemCount: users?.length,
              itemBuilder: (BuildContext context, int index) {
                final user =users?[index];
                return ListTile(
                  title: Text(user!.fullName),
                  subtitle: Text(user!.email),
                  // You can add more widgets here based on your requirements
                );
              },
            );
          }
        },
      ),
    );
  }
}



