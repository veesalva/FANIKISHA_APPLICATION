import 'package:fanikisha_app/models/user_model.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/otp_screen.dart';
import 'package:fanikisha_app/screens/authetication/login.dart';
import 'package:fanikisha_app/screens/authetication/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

// todo:perform validation  on the field inputs
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // controller from the SignUpController
  final controller = Get.put(SignUpController());


  // field for toogle password
  bool _obscureTextPassword = true;

  bool _obscureTextRepeatPassword = true;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform signup logic here
      //   // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
      // SignUpController.instance.phoneNumberAuthentication(controller.phoneNumber.text.trim());
      // Get.to(const OTPScreen());

      final user = UserModel(
          fullName: controller.fullName.text.trim(),
          email: controller.email.text.trim(),
          password: controller.password.text.trim(),
          phoneNumber: controller.phoneNumber.text.trim());
         // create the user in the database
         SignUpController.instance.createUser(user);
    //
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
              "Level up your saving habit",
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
                style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 16.0),
              const Text(
                "Create an Account",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              //   password text field
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureTextPassword = !_obscureTextPassword;
                      });
                    },
                  ),
                ),
                obscureText: _obscureTextPassword,
              ),

              //  repeat password text field
              const SizedBox(height: 16.0),
              TextFormField(
                controller: controller.repeatPassword,
                decoration: InputDecoration(
                    labelText: 'Repeat Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureTextRepeatPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureTextRepeatPassword =
                          !_obscureTextRepeatPassword;
                        });
                      },
                    )),
                obscureText: _obscureTextRepeatPassword,
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
                          "By clicking on ‘Sign Up’, you’re agreeing to the    ",
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0, 0, 8),
                        child: Text(
                          "Fanikisha Terms of Service and Privacy Policy.  ",
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
              const SizedBox(height: 10.0),
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
                    FaIcon(
                      FontAwesomeIcons.google,
                    color: Color.fromRGBO(0x34, 0xa8, 0x53, 1.0)
                                      ),
                    Text(
                      "Login with Google",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
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
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
