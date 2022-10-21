import 'package:flutter/material.dart';

class TasksFragment extends StatelessWidget {
  const TasksFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: const [
          TextField(
            decoration: InputDecoration(
              labelText: 'Найти задачу...',
            ),
          ),
        ],
      ),
    );
  }
}
