import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  String _fullname = '';
  String _email = '';
  String _password = '';
  String _repeatPassword = '';
  String _accountNumber = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      // For example, you can create an account with the provided information
      print('Signup successful!');
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Let's get you started".toUpperCase(),
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Create an Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
                onChanged: (value) {
                  _fullname = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more advanced email validation here
                  return null;
                },
                onChanged: (value) {
                  _email = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your account number';
                  }
                  // You can add more specific account number validation here
                  return null;
                },
                onChanged: (value) {
                  _accountNumber = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onChanged: (value) {
                  _password = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Repeat Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                controller: _repeatPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please repeat the password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onChanged: (value) {
                  _repeatPassword = value;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Bank Account Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your account number';
                  }
                  // You can add more specific account number validation here
                  return null;
                },
                onChanged: (value) {
                  _accountNumber = value;
                },
              ),
              const SizedBox(height: 32.0),
              const Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.checkSquare, // Use the checkbox icon
                    size: 38.0,
                    color: Colors.green,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 8.0, 0, 0),
                        child: Text(
                          "By clicking on ‘sign up’, you’re agreeing to the  ",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0, 0, 8),
                        child: Text(
                          "Chunky app Terms of Service and Privacy Policy  ",
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Sign Up'),
              ),
              SizedBox(height: 10.0),
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
            ],

          ),
        ),
      ),
    );
  }
}
