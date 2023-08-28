import 'package:fanikisha_app/firebase_options.dart';
import 'package:fanikisha_app/screens/authetication/forget_password/authetication_repository.dart';
import 'package:fanikisha_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AutheticationRepository()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      defaultTransition: Transition.leftToRightWithFade,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green,
          secondary: Colors.blue,
        )
      ),
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}
