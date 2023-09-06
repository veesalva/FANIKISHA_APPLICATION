import 'package:flutter/material.dart';

class MyFormPopup extends StatefulWidget {
  @override
  _MyFormPopupState createState() => _MyFormPopupState();
}

class _MyFormPopupState extends State<MyFormPopup> {
  TextEditingController textField1Controller = TextEditingController();
  TextEditingController textField2Controller = TextEditingController();
  // variable to hide a password
  bool _obscureTextPassword=true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Set the border radius here
      ),
      title:  Center(child: Text('Add Account Info')),
      content: Container(
        width: 320,
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: textField1Controller,
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Bank Account Number'),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
             height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              obscureText:_obscureTextPassword,
              controller: textField2Controller,
              decoration: const InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'SimBanking Pin',
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 250,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                  ),
                ),
                onPressed: () {
                  // Handle button click here.
                  // You can access the field values using textField1Controller.text and textField2Controller.text.
                  // You can also perform any necessary validation or processing.

                  // For example, you can print the field values:
                  print('Field 1: ${textField1Controller.text}');
                  print('Field 2: ${textField2Controller.text}');

                  // Close the popup.
                  Navigator.pop(context);
                },
                child:  Text('Add Account'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

