
import 'package:fanikisha_app/screens/authetication/home.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomePage() ,
    );
  }
}
