import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: Styles.bg,
        //iconTheme: const IconThemeData(color: Styles.icon),
        textTheme: GoogleFonts.robotoTextTheme().apply(
          displayColor: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: secondaryColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              //padding: MaterialStatePropertyAll(
              //  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              //),
              //shape: MaterialStatePropertyAll(
              //  RoundedRectangleBorder(borderRadius: Styles.borderRadius),
              //),
              ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      );

  static BorderRadius radius = BorderRadius.circular(20);

  static const List<BoxShadow> shadows = [
    // BoxShadow(
    //   color: Color.fromRGBO(0, 0, 0, 0.1),
    //   blurRadius: 2.21,
    //   offset: Offset(0, 0.5),
    // ),
    // BoxShadow(
    //   color: Color.fromRGBO(0, 0, 0, 0.1),
    //   blurRadius: 5.32,
    //   offset: Offset(0, 1.2),
    // ),
    // BoxShadow(
    //   color: Color.fromRGBO(0, 0, 0, 0.1),
    //   blurRadius: 10.02,
    //   offset: Offset(0, 2.25),
    // ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.1),
      blurRadius: 17.87,
      offset: Offset(0, 4.02),
    ),
    // BoxShadow(
    //   color: Color.fromRGBO(0, 0, 0, 0.1),
    //   blurRadius: 33.42,
    //   offset: Offset(0, 7.52),
    // ),
    // BoxShadow(
    //   color: Color.fromRGBO(0, 0, 0, 0.1),
    //   blurRadius: 80,
    //   offset: Offset(0, 18),
    // ),
  ];

  static const bgColor = Color(0xFFFBFBFC);

  static const darkColor = Color(0xFF454D69);

  static const accentColor = Color(0xFF3380F3);

  static const primaryColor = Color(0xFF0F0F10);

  static const secondaryColor = Color(0xFF1A1743);

  static const greenColor = Color(0xFF43B098);

  static const redColor = Color(0xFFEF3E40);

  static const greyColor = Color(0xFF92959D);

  static const tagBgColor = Color(0xFFF1F2F2);
}
