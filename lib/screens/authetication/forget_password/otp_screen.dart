import 'package:fanikisha_app/screens/authetication/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  final controller = Get.put(OTPController());

  @override
  Widget build(BuildContext context) {
    var otpValue;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CO\nDE",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(
              "Verification".toUpperCase(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Enter the verification code sent at" + "samsloyshock@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20.0,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.green.withOpacity(0.4),
              textStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              filled: true,
              onSubmit: (otp) {
                otpValue = otp;
                controller.verifyOTP(otp);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.verifyOTP(otpValue);
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
