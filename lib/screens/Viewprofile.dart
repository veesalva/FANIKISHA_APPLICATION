import 'package:flutter/material.dart';
import 'package:fanikisha_app/colors/colors.dart'; // custom added colors

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

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
              image: AssetImage("images/sample_profile.png"), fit: BoxFit.cover),
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
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Birth Date",
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
