import 'package:fanikisha_app/constant/Constant.dart';
import 'package:fanikisha_app/models/user_model.dart';
import 'package:fanikisha_app/screens/Viewprofile.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/authetication/logged_user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  UserModel? userModel;
  final controller = Get.put(LoggedUserDataController());
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
               'John Doe' ,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                "kaDSLJ",
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
                ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    child: Icon(FontAwesomeIcons.user),
                  ),
                  onTap: () {
                    //   move the user to change his or her details
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const ViewProfile();
                      },
                    ));
                  },
                  title: const Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: const Text(
                    "Make Changes to Your Account",
                    style: TextStyle(),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                const SizedBox(
                  height: 10,
                ),
                 ListTile(
                  onTap: () {
                    print("hello");
                    controller.getUserData("1").then((value) => {
                      print(value)
                    }).whenComplete(() => print("hello")
                    );
                  },
                  leading: const CircleAvatar(
                    radius: 25,
                    child: Icon(FontAwesomeIcons.lock),
                  ),
                  title: const Text(
                    "Face ID/ Touch ID",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  subtitle: const Text(
                    "Manage Your Device Security",
                    style: TextStyle(),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
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
                // log out ListTile
                ListTile(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        backgroundColor: Colors.black,
                        title: const Text('Log out',
                            style: TextStyle(color: Colors.white)),
                        content: const Text(
                          'Log out off your account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                AutheticationRepository.instance.logout(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
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
          // more card
          const Card(
            margin: EdgeInsets.all(10),
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
                      "Check for Updates & Version",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                      "FAQs & Support",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                      "Legal",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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

          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Stay in Touch",
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          // stay in touch card
          const Card(
            margin: EdgeInsets.all(10),
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
                      "Instagram",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                      "Facebook",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
                      "Rate the App",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
