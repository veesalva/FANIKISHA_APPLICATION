import 'package:flutter/material.dart';

class MakeSavings extends StatelessWidget {
  const MakeSavings({super.key});

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
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Make Savings",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Select Account"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Enter Amount"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Transactions",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {

            },
            leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
              ),
              height: double.infinity,
              child: Icon(Icons.save_rounded,color: Colors.white),

            ),
            title: Text("SAVE"),
            subtitle: Text("22/08/2023"),
            trailing: Text("TZS 23500"),
          ),
          ListTile(
            onTap: () {

            },
            leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
              ),
              height: double.infinity,
              child: Icon(Icons.save_rounded,color: Colors.white),

            ),
            title: Text("SAVE"),
            subtitle: Text("22/08/2023"),
            trailing: Text("TZS 23500"),
          ),
          ListTile(
            onTap: () {

            },
            leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
              ),
              height: double.infinity,
              child: Icon(Icons.save_rounded,color: Colors.white),

            ),
            title: Text("SAVE"),
            subtitle: Text("22/08/2023"),
            trailing: Text("TZS 23500"),
          ),
          ListTile(
            onTap: () {

            },
            leading: Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green
              ),
              height: double.infinity,
              child: Icon(Icons.save_rounded,color: Colors.white),

            ),
            title: Text("SAVE"),
            subtitle: Text("22/08/2023"),
            trailing: Text("TZS 23500"),
          ),

        ],
      ),
    );
  }
}
