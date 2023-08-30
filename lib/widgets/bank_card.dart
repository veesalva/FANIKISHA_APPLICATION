import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  BankCard({super.key, required this.cardHolder});

  final String cardHolder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: 330,
      height: 180,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Colors.black, Colors.green],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 30,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              '5821 **** **** **** 1234',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  const Text(
                    "Card Holder ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    " ${cardHolder}",
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ]),
                Column(children: [
                  const Text(
                    "Card Holder ",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    " ${cardHolder}",
                    style: const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ]),
                const Column(children: [
                  Icon(Icons.toggle_on_outlined,color: Colors.white,),
                  Text(
                    " Show Card",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
