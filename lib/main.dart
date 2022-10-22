import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection.dart';
import 'presentation/pages/home/home_page.dart';
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
      theme: theme,
      onGenerateRoute: routeByName,
      initialRoute: HomePage.name,
    );
  }

  MaterialPageRoute router(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute? routeByName(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.name:
        return router(BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: const LoginPage(),
        ));
      case HomePage.name:
        return router(MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<TasksBloc>()),
          ],
          child: const HomePage(),
        ));
    }
    return null;
  }

  ThemeData get theme => ThemeData(
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
}
