import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rostelecom/presentation/pages/note/note_form.dart';

import 'data/model/task_model.dart';
import 'injection.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/pages/login/login_page.dart';
import 'presentation/pages/task/task_form.dart';
import 'presentation/pages/task/task_page.dart';
import 'styles.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LoginBloc>()),
        BlocProvider(create: (_) => sl<TasksBloc>()..add(TasksInit())),
        BlocProvider(create: (_) => sl<NotesBloc>()..add(NotesInit())),
      ],
      child: MaterialApp(
        title: 'Rostelecom',
        theme: Styles.theme,
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
