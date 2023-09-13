import 'package:fanikisha_app/colors/colors.dart';
import 'package:fanikisha_app/firebase_options.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/splash_screen.dart'; // Import the splash_screen.dart file
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// saving application
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AutheticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColors.primaryColor,
          secondary: AppColors.accentColor,
        ),

      ),
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}
