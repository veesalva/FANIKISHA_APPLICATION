import 'package:fanikisha_app/screens/authetication/forget_password/forget_password_mail_screen.dart';
import 'package:flutter/material.dart';
import 'forget_password_btn_widget.dart';

class ForgetPasswordScreen {
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
            ForgetPasswordBtnWidget(
              title: "E-mail",
              iconBtn: Icons.mail_outline_rounded,
              subtitle: "Reset via E-mail Verification",
              onTap: () {
                //todo: this button to goto ForgotEmail does not work
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordMailScreen(),
                  ), // Navigate to the target page
                );
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
                title: "Phone No",
                iconBtn: Icons.mobile_friendly_rounded,
                subtitle: "Reset via Phone Verification",
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
