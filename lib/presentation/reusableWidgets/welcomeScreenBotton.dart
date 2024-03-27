import 'package:flutter/material.dart';

import '../../theme/appTheme.dart';

class WelcomeScreenButton extends StatelessWidget {
  Icon icon;
  String text;
  Function onclick;

  WelcomeScreenButton(
      {required this.icon, required this.text, required this.onclick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          onclick();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              color: MyTheme.yellowColor,
              borderRadius: BorderRadius.circular(15)),
          child: Card(
            color: Colors.black,
            margin: EdgeInsets.all(2),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: icon,
              title: Text(
                text,
                style: TextStyle(color: MyTheme.yellowColor, fontSize: 26),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
