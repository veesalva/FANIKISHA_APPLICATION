import 'package:flutter/material.dart';

class HomePageNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    'images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const Text(
                  'Level up your saving habit ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                const Center(
                  child: Text(
                    'Fanikisha mipango yako nasi       '
                        '   Weka akiba kwa muda utakao.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    ));
  }
}
