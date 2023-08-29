import 'package:fanikisha_app/screens/GoalList.dart';
import 'package:fanikisha_app/screens/MakeSavings.dart';
import 'package:fanikisha_app/screens/authetication/login.dart';
import 'package:fanikisha_app/screens/authetication/signup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          // Background Picture
          // Content
          Column(
            children: [
              const SizedBox(height: 80), // Adjust as needed
              Center(
                child: Image.asset(
                  'images/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'FANIKISHA ',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Level Up your Saving habit ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                'Fanikisha mipango yako nasi. ',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Weka akiba kwa muda utakao.',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              // Other content goes here
              Center(
                child: Image.asset(
                  'images/saving.jpg',
                  width: 400,
                  height: 400,
                ),
              ),
            ],
          ),

          //login button
          Positioned(
            left: 0,
            right: 0,
            bottom: 100,
            child: Row(
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
                    'Log in',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          // Sign up button
          Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Row(
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
                        builder: (context) =>SignUp(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
