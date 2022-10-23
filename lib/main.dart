import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rostelecom/presentation/pages/home/settings/bloc/settings_bloc.dart';
import 'package:rostelecom/presentation/pages/note/note_form.dart';

import 'data/model/task_model.dart';
import 'injection.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/task/task_form.dart';
import 'presentation/pages/task/task_page.dart';
import 'styles.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(
      ChangeNotifierProvider(create: (context) => DarkMode(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LoginBloc>()),
        BlocProvider(create: (_) => sl<TasksBloc>()..add(TasksInit())),
        BlocProvider(create: (_) => sl<NotesBloc>()..add(NotesInit())),
        BlocProvider(create: (_) => SettingsBloc()),
      ],
      child: MaterialApp(
        title: 'Rostelecom',
        theme: Styles.theme(thmode.darkMode),
        onGenerateRoute: routeByName,
        // initialRoute: HomePage.name,
        initialRoute: LoginPage.name,
      ),
    );
  }

  MaterialPageRoute router(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute? routeByName(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.name:
        return router(LoginPage());
      case HomePage.name:
        return router(const HomePage());
      case TaskPage.name:
        final task = settings.arguments as TaskModel;
        return router(TaskPage(task));
      case TaskForm.name:
        return router(const TaskForm());
      case NoteForm.name:
        return router(const NoteForm());
    }
    return null;
  }
}

class DarkMode with ChangeNotifier {
  bool darkMode = true; ///by default it is true
  ///made a method which will execute while switching
  void changeMode() {
    darkMode = !darkMode;
    notifyListeners(); ///notify the value or update the widget value
  }
}
