import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(12), // Adjust the radius as needed
              ),
              leading: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("images/saving.jpg"),
                        fit: BoxFit.cover)),
              ),
              title: const Text(
                "John Doe",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "@johndoe",
                style: TextStyle(color: Colors.white),
              ),
              tileColor: Colors.green,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: const Divider(height: 3, color: Colors.grey, thickness: 1),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Personal Info",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(FontAwesomeIcons.user),
                  ),
                  title: Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: Text(
                    "Make Changes to Your Account",
                    style: TextStyle(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(FontAwesomeIcons.lock),
                  ),
                  title: Text(
                    "Face ID/ Touch ID",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: Text(
                    "Manage Your Device Security",
                    style: TextStyle(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 10,
                ),
                const ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.verified_user),
                  ),
                  title: Text(
                    "Two-Factor Authetication",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: Text(
                    "Further Secure Your  Account for safetly",
                    style: TextStyle(),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    //   todo: Log out codes here
                  },
                  leading: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.logout),
                  ),
                  title: const Text(
                    "Log Out",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: const Text(
                    "Log out from your account",
                    style: TextStyle(),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "More",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),

          ),
          const Card(
            margin:EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(

                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.supervised_user_circle),
                    ),
                    title: Text(
                      "About Us",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.help_outline_rounded),
                    ),
                    title: Text(
                      "Help & Support",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      child: Icon(Icons.verified_user),
                    ),
                    title: Text(
                      "Terms & Conditions",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
