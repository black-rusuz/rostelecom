import 'package:flutter/material.dart';

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
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  BottomNavigationBar get navBar => BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        items: [
          navItem(const Icon(Icons.tune_rounded)),
          navItem(const Icon(Icons.liquor_rounded)),
          navItem(const Icon(Icons.insert_chart_outlined_outlined)),
          navItem(const Icon(Icons.settings_rounded)),
        ],
      );

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
      body: pages[selectedIndex],
      bottomNavigationBar: navBar,
      floatingActionButton: button,
    );
  }
}
