import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles.dart';
import 'hidden/hidden_fragment.dart';
import 'hot/hot_fragment.dart';
import 'notes/notes_fragment.dart';
import 'task_detail/task_detail.dart';
import 'tasks/bloc/tasks_bloc.dart';
import 'tasks/tasks_fragment.dart';

export 'notes/bloc/notes_bloc.dart';
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
    // const SettingsFragment(),
    const TaskDetail(),
  ];

  BottomNavigationBarItem navItem(IconData icon) =>
      BottomNavigationBarItem(label: '', icon: Icon(icon));

  void addTask() => context.read<TasksBloc>().add(AddTask());

  void addNote() => context.read<TasksBloc>().add(AddTask());

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
              Padding(
                padding: const EdgeInsets.all(4),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: 'https://github.com/gsusha.png',
                  ),
                ),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        items: [
          navItem(Icons.home_rounded),
          navItem(Icons.sticky_note_2_outlined),
          navItem(Icons.local_fire_department),
          navItem(Icons.visibility_off_rounded),
          navItem(Icons.settings_rounded),
        ],
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
