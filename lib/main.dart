import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/login/login_page.dart';
import 'styles.dart';

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
      theme: Styles.theme,
      onGenerateRoute: routeByName,
      initialRoute: HomePage.name,
      // initialRoute: LoginPage.name,
    );
  }

  MaterialPageRoute router(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute? routeByName(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.name:
        return router(BlocProvider(
          create: (_) => sl<LoginBloc>(),
          child: LoginPage(),
        ));
      case HomePage.name:
        return router(MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => sl<TasksBloc>()..add(TasksInit())),
            BlocProvider(create: (_) => sl<NotesBloc>()..add(NotesInit())),
          ],
          child: const HomePage(),
        ));
    }
    return null;
  }
}
