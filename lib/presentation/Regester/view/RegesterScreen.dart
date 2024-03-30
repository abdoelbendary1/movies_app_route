import 'package:flutter/material.dart';
import 'package:movies_app_route/presentation/user_home/view/home_screen.dart';

import '../../../theme/appTheme.dart';
import '../../reusableWidgets/Formfield.dart';

class RegesterScreen extends StatefulWidget {
  static const String routName = 'regester';

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  var formKey1 = GlobalKey<FormState>();

  bool obscureText = true;

  bool obscureText2 = true;

  TextEditingController userController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/Group 24.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
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
                            lable: 'User Name',
                            controller: userController,
                            icon: Icon(Icons.person),
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'please enter user name';
                              }
                              return null;
                            },
                          ),
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
                                  return 'password should contain more than 6 char';
                                }
                                return null;
                              },
                            ),
                            Padding(
                                padding: const EdgeInsets.all(20.0),
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
                          Stack(alignment: Alignment.centerRight, children: [
                            FormFeiled(
                              lable: 'Confirm Password',
                              obsscure: obscureText2,
                              keyboard: TextInputType.number,
                              icon: Icon(Icons.lock_clock),
                              controller: confirmPasswordController,
                              validator: (text) {
                                if (text == null || text.trim().isEmpty) {
                                  return 'please enter confirm Password';
                                }
                                if (text != confirmPasswordController.text) {
                                  return 'confirmed password doesnot match password';
                                }
                                return null;
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: InkWell(
                                  onTap: () {
                                    if (obscureText2 == false) {
                                      obscureText2 = true;
                                    } else if (obscureText2 == true) {
                                      obscureText2 = false;
                                    }
                                    setState(() {});
                                  },
                                  child: obscureText2 == false
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: MyTheme.yellowColor,
                                        )
                                      : Icon(
                                          Icons.remove_red_eye,
                                          color: Color(0x69ffbb3b),
                                        )),
                            )
                          ]),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
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
                            regester();
                            setState(() {});
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void regester() async {
    if (formKey1.currentState!.validate() == true) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    }
  }
}
