import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData get theme => ThemeData(
        primarySwatch: Colors.blue,
        //scaffoldBackgroundColor: Styles.bg,
        //iconTheme: const IconThemeData(color: Styles.icon),
        textTheme: GoogleFonts.ptSansTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(color: Colors.black),
          // iconTheme: IconThemeData(color: Colors.black),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
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
    BoxShadow(
      color: Colors.black,
      blurRadius: 2.21,
      offset: Offset(0, 0.5),
    ),
    BoxShadow(
      color: Colors.black,
      blurRadius: 5.32,
      offset: Offset(0, 1.2),
    ),
  ];
}
