import 'package:flutter/material.dart';

class SavingPlanOptions extends StatelessWidget {
  const SavingPlanOptions({super.key});

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Choose Saving Plan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Controls the position of the shadow
                ),
              ],
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "1x",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text(
                "Simple Plan",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("TZS 5,000 - TZS 10,000"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Controls the position of the shadow
                ),
              ],
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  "1.5x",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text(
                "Medium Plan",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("TZS 15,000 - TZS 20,000"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Controls the position of the shadow
                ),
              ],
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Text(
                  "3X",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text(
                "Heavy Plan",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("TZS 25,000 - TZS 30,000"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Controls the position of the shadow
                ),
              ],
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text(
                  "5X",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text(
                "Fanikisha Plan",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("TZS 35,000 - TZS 40,000"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0,30,20,20),
            child: Text(
              "Make Custom Plan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Controls the position of the shadow
                ),
              ],
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.cyan,
                child: Text(
                  "XX",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              title: Text(
                "Simple Plan",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              subtitle: Text("TZS 35,000 - TZS 40,000"),
              trailing: Icon(
                Icons.check_circle,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
