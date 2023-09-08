import 'package:fanikisha_app/screens/authetication/change_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authetication/logged_user_data_controller.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  final changeProfileController = Get.put(ChangeProfileController());
  final controller = Get.put(LoggedUserDataController());

  @override
  void initState() {
    super.initState();
    getUser();
  }

  // fetch data from db and set to the text fields
  Future<void> getUser() async {
    await controller.getUserData().then((value) => {
      changeProfileController.fullName.text=value!['fullName'],
      changeProfileController.email.text=value!['email'],
      changeProfileController.password.text=value!['password'],
      changeProfileController.phoneNumber.text=value!['phoneNumber'],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 130,
            height: 130,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("images/profile.jpg"), fit: BoxFit.cover),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text("Victoria Kundi"),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text("victoriakundi@gmail.com"),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              controller: changeProfileController.fullName,
              decoration: const InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              controller: changeProfileController.email,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              controller: changeProfileController.password,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              controller: changeProfileController.phoneNumber,
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Container(
              width: 30,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Update Profile"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
