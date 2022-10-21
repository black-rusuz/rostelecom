import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'tasks/tasks_fragment.dart';

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

  final List<Widget> pages = [
    const TasksFragment(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  BottomNavigationBarItem navItem(Icon icon) =>
      BottomNavigationBarItem(label: '', icon: icon);

  FloatingActionButton? get button => selectedIndex == 0
      ? FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.local_drink_rounded),
          label: const Text('Поиск'),
        )
      : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(4),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: 'https://github.com/gsusha.png',
            ),
          ),
        ),
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        items: [
          navItem(const Icon(Icons.tune_rounded)),
          navItem(const Icon(Icons.liquor_rounded)),
          navItem(const Icon(Icons.insert_chart_outlined_outlined)),
          navItem(const Icon(Icons.settings_rounded)),
        ],
      ),
      floatingActionButton: button,
    );
  }
}
