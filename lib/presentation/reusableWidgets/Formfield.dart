import 'package:flutter/material.dart';

import '../../theme/appTheme.dart';

class FormFeiled extends StatelessWidget {
  String lable;
  Icon icon;
  TextEditingController controller;
  TextInputType keyboard;
  String? Function(String?) validator;
  bool obsscure;

  FormFeiled(
      {required this.lable,
      required this.icon,
      required this.controller,
      required this.validator,
      this.obsscure = false,
      this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        style: TextStyle(color: Color(0xffFFBB3B)),
        validator: validator,
        obscureText: obsscure,
        decoration: InputDecoration(
          labelText: lable,
          prefixIcon: icon,
          prefixIconColor: Color(0x81ffa43b),
          labelStyle: TextStyle(color: Color(0x69ffbb3b)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Color(0x2affbb3b), width: 2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: MyTheme.yellowColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
