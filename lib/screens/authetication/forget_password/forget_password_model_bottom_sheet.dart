import 'package:fanikisha_app/screens/authetication/forget_password/forget_password_mail_screen.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/forget_password_phoneNo_screen.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen {
  // This is the bottomModal when pop up when the user clicks Forgot password
  // It gives the user options  to reset password either using phone number or email
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Make Selection!",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "Select one one of the option given below to reset your password.",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            // it is the button inside the bottomModalSheet for email reset option
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgetPasswordMailScreen();
                        },
                      ),
                    );
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 8), // Add space between icon and text
                    ],
                  ),
                  label: const Text(
                    'Reset Your Password using  Email',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(30),
                    backgroundColor: Colors.green,
                    side: const BorderSide(color: Colors.grey),
                    alignment:
                        Alignment.centerLeft, // Align icon and text to right
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // it is the button inside the bottomModalSheet for phone number reset option
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const ForgotPasswordPhoneNoScreen();
                        },
                      ),
                    );
                  },
                  icon: const Row(
                    children: [
                      Icon(Icons.phone_android, color: Colors.white),
                      SizedBox(width: 8), // Add space between icon and text
                    ],
                  ),
                  label: const Text(
                    'Reset Your Password using  Phone Number',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(30),
                    backgroundColor: Colors.green,
                    side: const BorderSide(color: Colors.grey),
                    alignment:
                    Alignment.centerLeft, // Align icon and text to right
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
