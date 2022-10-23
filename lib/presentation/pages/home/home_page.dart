import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/utils.dart';
import '../../../styles.dart';
import '../../widgets/base_avatar.dart';
import '../login/bloc/login_bloc.dart';
import 'hidden_fragment.dart';
import 'hot_fragment.dart';
import 'notes/note_form.dart';
import 'notes/notes_fragment.dart';
import 'settings/settings_fragment.dart';
import 'tasks/bloc/tasks_bloc.dart';
import 'tasks/task_form.dart';
import 'tasks/tasks_fragment.dart';

export 'notes/bloc/notes_bloc.dart';
export 'settings/bloc/settings_bloc.dart';
export 'tasks/bloc/tasks_bloc.dart';

class HomePage extends StatefulWidget {
  static const String name = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void setIndex(int index) => setState(() => selectedIndex = index);

  final List<String> titles = [
    'Задачи',
    'Заметки',
    '«Горящий» список',
    'Скрытые задачи',
    'Настройки',
  ];

  final List<Widget> pages = [
    const TasksFragment(),
    const NotesFragment(),
    const HotFragment(),
    const HiddenFragment(),
    const SettingsFragment(),
  ];

  BottomNavigationBarItem navItem(IconData icon, [int? count, Color? color]) =>
      BottomNavigationBarItem(
          label: '',
          icon: Stack(
            children: [
              Icon(icon),
              if (count != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        count.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
            ],
          ));

  void addTask() => Navigator.of(context).pushNamed(TaskForm.name);

  void addNote() => Navigator.of(context).pushNamed(NoteForm.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              titles[selectedIndex],
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            actions: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (prev, next) => next is LoginSuccess,
                builder: (context, state) {
                  if (state is LoginSuccess) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 30, 4),
                      child: BaseAvatar(
                        size: 50,
                        fontSize: 20,
                        name: Utils.stringToLetters(state.user.name),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 30, 4),
                    child: BaseAvatar(
                      size: 50,
                      fontSize: 20,
                      name: Utils.stringToLetters('JD'),
                    ),
                  );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: pages[selectedIndex],
            ),
          )
        ],
      ),
      bottomNavigationBar: BlocBuilder<TasksBloc, TasksState>(
        buildWhen: (prev, next) => next is TasksSuccess,
        builder: (context, state) {
          if (state is TasksSuccess) {
            return BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: setIndex,
              items: [
                navItem(Icons.home_rounded, state.undone, Styles.darkColor),
                navItem(Icons.sticky_note_2_outlined),
                navItem(
                    Icons.local_fire_department, state.hot, Styles.redColor),
                navItem(Icons.visibility_off_rounded),
                navItem(Icons.settings_rounded),
              ],
              backgroundColor: Colors.white,
            );
          }
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: setIndex,
            items: [
              navItem(Icons.home_rounded),
              navItem(Icons.sticky_note_2_outlined),
              navItem(Icons.local_fire_department),
              navItem(Icons.visibility_off_rounded),
              navItem(Icons.settings_rounded),
            ],
            backgroundColor: Colors.white,
          );
        },
      ),
      floatingActionButton: selectedIndex == 0 || selectedIndex == 1
          ? FloatingActionButton.extended(
              onPressed: selectedIndex == 0 ? addTask : addNote,
              label: Text(
                selectedIndex == 0 ? 'Новая задача' : 'Новая заметка',
              ),
              icon: const Icon(Icons.add),
              backgroundColor: Colors.white,
              foregroundColor: Styles.greyColor,
              extendedTextStyle: const TextStyle(letterSpacing: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            )
          : null,
    );
  }
}
