import 'package:flutter/material.dart';

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
                  image: AssetImage("images/profile.jpg"), fit: BoxFit.cover),
            ),
          ),
          Align(
            child: Text("Victoria Kundi"),
            alignment: Alignment.center,
          ),
          Align(
            child: Text("victoriakundi@gmail.com"),
            alignment: Alignment.center,
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.fromLTRB(10,5,10,5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Last Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10,5,10,5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10,5,10,5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10,5,10,5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.fromLTRB(10,5,10,5),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: "Birth Date",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,20,30,20),
            child: Container(
              width: 30,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Update Profile"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
