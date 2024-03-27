import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/user_home/view/home_screen.dart';
import 'package:movies_app_route/theme/appTheme.dart';

import '../../Login/view/LoginScreen.dart';
import '../../Regester/view/RegesterScreen.dart';
import '../../reusableWidgets/welcomeScreenBotton.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routName = 'welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Group 24.png'),
              Divider(
                color: MyTheme.yellowColor,
                thickness: 1,
                height: MediaQuery.of(context).size.height * 0.1,
                endIndent: 25,
                indent: 25,
              ),
              WelcomeScreenButton(
                  icon: Icon(
                    Icons.perm_identity_rounded,
                    color: MyTheme.yellowColor,
                    size: 30,
                  ),
                  text: 'Guest',
                  onclick: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }),
              WelcomeScreenButton(
                icon: Icon(
                  Icons.login,
                  color: MyTheme.yellowColor,
                  size: 30,
                ),
                text: 'Login',
                onclick: () {
                  Navigator.pushNamed(context, LoginScreen.routName);
                },
              ),
              WelcomeScreenButton(
                  icon: Icon(
                    Icons.how_to_reg_rounded,
                    color: MyTheme.yellowColor,
                    size: 30,
                  ),
                  text: 'Regester',
                  onclick: () {
                    Navigator.pushNamed(context, RegesterScreen.routName);
                  }),
              SizedBox(
                height: 26,
              ),
              Column(
                children: [
                  Text(
                    'Welcome to our',
                    style: TextStyle(color: MyTheme.yellowColor, fontSize: 20),
                  ),
                  Text(
                    'Movie App ',
                    style: TextStyle(color: Color(0xffffffff), fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
