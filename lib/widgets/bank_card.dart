import 'package:fanikisha_app/widgets/pop_up_screen.dart';
import 'package:flutter/material.dart';

class BankCard extends StatelessWidget {
  BankCard(
      {super.key,
        required this.cardHolder,
        required this.bankAccountNumber,
        required this.isAccountAdded});

  final String cardHolder;
  final String bankAccountNumber;
  final bool isAccountAdded;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      width: 330,
      height: 200,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // show bank icon or No account word automatically
                isAccountAdded
                    ? const Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 30,
                )
                    : const Column(
                  children: [
                    Text(
                      "NO ACCOUNT",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "****** ACCOUNT",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed:() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return MyFormPopup();
                          },
                        );
                      },
                      child: const CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Text(
                      "add account",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
           Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              bankAccountNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          const Spacer(
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