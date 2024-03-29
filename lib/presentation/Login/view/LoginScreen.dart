import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/user_home/view/home_screen.dart';

import '../../../theme/appTheme.dart';
import '../../Regester/view/RegesterScreen.dart';
import '../../reusableWidgets/Formfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey1 = GlobalKey<FormState>();

  bool obscureText = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x76090909),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/Group 24.png',
                width: MediaQuery.of(context).size.width * 0.38,
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Form(
                      key: formKey1,
                      child: Column(
                        children: [
                          FormFeiled(
                            lable: 'Email',
                            icon: Icon(Icons.mail),
                            keyboard: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please enter Email';
                              }
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(emailController.text);
                              if (!emailValid) {
                                return 'please enter valid email';
                              }
                              return null;
                            },
                          ),
                          Stack(alignment: Alignment.centerRight, children: [
                            FormFeiled(
                              lable: ('Password'),
                              obsscure: obscureText,
                              icon: Icon(Icons.lock),
                              keyboard: TextInputType.number,
                              controller: passwordController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'please enter Password';
                                }
                                if (text.length < 6) {
                                  return 'password shouid contain more than 6 char';
                                }
                                return null;
                              },
                            ),
                            Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: InkWell(
                                    onTap: () {
                                      if (obscureText == false) {
                                        obscureText = true;
                                      } else if (obscureText == true) {
                                        obscureText = false;
                                      }
                                      setState(() {});
                                    },
                                    child: obscureText == false
                                        ? Icon(
                                            Icons.remove_red_eye,
                                            color: MyTheme.yellowColor,
                                          )
                                        : Icon(
                                            Icons.remove_red_eye,
                                            color: Color(0x69ffbb3b),
                                          )))
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size.fromHeight(50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(MyTheme.yellowColor),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            login();
                            setState(() {});
                          },
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Creat account?',
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RegesterScreen.routName);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: MyTheme.yellowColor, fontSize: 20),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    if (formKey1.currentState!.validate() == true) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
