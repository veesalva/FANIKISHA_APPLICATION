import 'package:fanikisha_app/screens/authetication/account_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFormPopup extends StatefulWidget {
  @override
  _MyFormPopupState createState() => _MyFormPopupState();
}

class _MyFormPopupState extends State<MyFormPopup> {

  final controller = Get.put(AccountController());

  // variable to hide a password
  bool _obscureTextPassword=true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Set the border radius here
      ),
      title:  const Center(child: Text('Add Account Info')),
      content: Container(
        width: 320,
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller.accountNumber,
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Bank Account Number'),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
             height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              obscureText:_obscureTextPassword,
              controller: controller.accountPin,
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

