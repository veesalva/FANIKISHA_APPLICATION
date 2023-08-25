import 'package:flutter/material.dart';


class ForgetPasswordBtnWidget extends StatelessWidget {
  const ForgetPasswordBtnWidget({
    required this.iconBtn,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData iconBtn;
  final String title,subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){onTap;},
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey.shade200),
        child: Row(
          children: [
            Icon(
              iconBtn,
              size: 60.0,
            ),
            SizedBox(width: 10.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: Theme.of(context).textTheme.headline6,),
                Text(subtitle,style: Theme.of(context).textTheme.bodyText2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}