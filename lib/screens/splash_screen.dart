import 'package:fanikisha_app/screens/authetication/AuthService.dart';
import 'package:fanikisha_app/screens/home.dart';
import 'package:fanikisha_app/widgets/BottomNavigationBarWidget.dart';
import 'package:fanikisha_app/colors/colors.dart'; // custom added colors
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              width: 200,
              height: 200,
            ),
            const Text(
              'FANIKISHA ',
              style: TextStyle(
                fontSize: 60,
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
          ],
        ),
      ),
    );
  }

  Future startTimer() async {
    await Future.delayed(const Duration(milliseconds: 5000));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if(AuthService.isUserLoggenIn() == true) {
            // User is logged in, redirect to the dashboard
            return BottomNavigationBarWidget();
          } else {
            //User is not logged in, redirect to the login page
            return HomePage();
          };
        },
      ),
    );
  }
}
