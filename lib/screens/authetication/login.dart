import 'package:fanikisha_app/screens/authetication/forget_password/forget_password_model_bottom_sheet.dart';
import 'package:fanikisha_app/screens/authetication/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'forget_password/forget_password_btn_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 50.0),
            Text(
              "Welcome Back".toUpperCase(),
              style: TextStyle(fontSize: 25.0),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 28.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.fingerprint_outlined),
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            //rember me and forgot password options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                    const Text('Remember Me'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the forgot password screen
                  ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Perform login logic using _emailController.text and _passwordController.text
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 25.0),
            //divider codes
            const Row(children: <Widget>[
              Expanded(
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text("OR"),
              Expanded(
                  child: Divider(
                color: Colors.black,
              )),
            ]),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(FontAwesomeIcons.google),
                  Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            //dont have an account button
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
