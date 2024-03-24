import 'package:flutter/material.dart';

class MyTheme{
  static Color whiteColor=Color(0xffC6C6C6);
  static Color noMovieColor=Color(0xffB5B4B4);
  static Color yellowColor=Color(0xffFFB224);
  static Color greyColor=const Color(0xff514F4F);
  static Color blackColor=Color(0xff1E1E1E);


  static ThemeData lightTheme=ThemeData(
      primaryColor: whiteColor,
      scaffoldBackgroundColor:Colors.transparent,
      appBarTheme:  AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color:whiteColor,
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: yellowColor,
        showUnselectedLabels: true,
      ),

      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22,fontWeight: FontWeight.bold,color: whiteColor),


        titleMedium: TextStyle(
            fontSize: 20,color: blackColor,fontWeight: FontWeight.w400),


        titleSmall: TextStyle(
            fontSize: 18,color: blackColor,fontWeight: FontWeight.w300),
      ) );

}