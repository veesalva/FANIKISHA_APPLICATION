import 'package:fanikisha_app/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class PaymentInvoice extends StatelessWidget {
  PaymentInvoice({super.key});

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
              "Payment Invoice",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
          const Card(
            margin: EdgeInsets.all(10),
            elevation: 4.0, // Controls the elevation/shadow of the cards
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0,15,8,15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "INFO",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "Invoice #20230890",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DATE",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            "22-10-2023",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PAY ID",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "222220230890",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PAY NUMBER",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          Text(
                            "0784901477",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Divider(
            thickness: 2,
          ),
          MyDataTable(),
          const SizedBox(
            height: 100,
          ),
          const Divider(thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Grand Total".toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "54,000".toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
           margin: const EdgeInsets.all(60),
            child: ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Confirm payment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
