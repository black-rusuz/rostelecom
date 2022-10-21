import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection.dart';
import 'presentation/pages/login/login_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rostelecom',
      onGenerateRoute: routeByName,
      initialRoute: LoginPage.name,
      theme: theme,
    );
  }

  MaterialPageRoute router(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute? routeByName(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.name:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<LoginBloc>(),
            child: const LoginPage(),
          ),
        );
    }
    return null;
  }

  ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        //primarySwatch: Styles.blue,
        //scaffoldBackgroundColor: Styles.bg,
        //iconTheme: const IconThemeData(color: Styles.icon),
        textTheme: GoogleFonts.ptSansTextTheme().apply(
          bodyColor: Colors.white,
          // displayColor: Colors.red,
        ),
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          shadowColor: Colors.transparent,
          // iconTheme: IconThemeData(color: Colors.black),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          //fillColor: Styles.inputBg,
          //hoverColor: Styles.inputBg,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            //borderRadius: Styles.borderRadius,
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
      );
}
