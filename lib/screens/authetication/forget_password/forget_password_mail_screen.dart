import 'package:flutter/material.dart';
class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 120,),
            //todo:change image
            Image.asset("images/saving.jpg")
          ],
        ),
      ),
    );
  }
}
