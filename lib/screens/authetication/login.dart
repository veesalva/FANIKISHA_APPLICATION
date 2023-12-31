import 'package:fanikisha_app/screens/authetication/forget_password/forget_password_model_bottom_sheet.dart';
import 'package:fanikisha_app/screens/authetication/sign_in_controller.dart';
import 'package:fanikisha_app/screens/authetication/signup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignInController());
  bool _rememberMe = false;

  @override
  void dispose() {
    super.dispose();
  }

  bool _obscureText = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      print("hello sigin");
      controller.signInUser(
          controller.email.text.trim(), controller.password.text.trim());
    }
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
              style: const TextStyle(fontSize: 25.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextField(
                    controller: controller.email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 28.0),
                  TextField(
                    controller: controller.password,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.fingerprint_outlined),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  //remember me and forgot password options
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
                          ForgetPasswordScreen.buildShowModalBottomSheet(
                              context);
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform signup logic here
                          print("hello sigin");
                          controller.signInUser(
                              controller.email.text.trim(), controller.password.text.trim());
                        }
                      },
                      child: const Text('Login'),
                    ),
                  ),
                ],
              ),
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
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            //dont have an account button
            const SizedBox(
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
                    'Sign Up',
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
