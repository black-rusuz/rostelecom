import 'package:flutter/material.dart';

import '../../../../styles.dart';
import '../../../widgets/base_card.dart';
import '../../../widgets/tasks_board.dart';

class TasksFragment extends StatelessWidget {
  const TasksFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Найти задачу...',
            ),
          ),
          const SizedBox(height: 20),
          const StatsCard(),
          const SizedBox(height: 40),
          //const TasksBoard(),
          GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: const [
                  Icon(Icons.add),
                  Text('Новая задача'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      borderRadius: 20,
      child: Column(
        children: [
          Row(
            children: const [
              StatCard(
                color: Styles.darkColor,
                icon: Icons.account_balance,
                title: 'Задач',
                value: 2,
              ),
              SizedBox(width: 10),
              StatCard(
                color: Styles.accentColor,
                icon: Icons.account_balance,
                title: 'Назначено',
                value: 4,
              ),
              SizedBox(width: 10),
              StatCard(
                color: Colors.white,
                icon: Icons.account_balance,
                title: 'Завершено',
                value: 5,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Подходит к концу: '),
              Text('42%'),
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final int value;

  const StatCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCard(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        color: color,
        borderRadius: 20,
        child: Column(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20),
            ),
            const SizedBox(height: 15),
            Text(title),
            const SizedBox(height: 15),
            Text(value.toString()),
          ],
        ),
      ),
    );
  }
}
