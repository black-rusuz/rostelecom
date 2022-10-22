import 'package:flutter/material.dart';

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
          BaseCard(
            color: Colors.white,
            borderRadius: 20,
            child: Column(
              children: [
                Row(
                  children: [
                    BaseCard(
                      color: Colors.grey,
                      borderRadius: 20,
                      child: Column(
                        children: const [
                          Icon(Icons.account_balance),
                          Text('Задач'),
                          Text('2'),
                        ],
                      ),
                    ),
                    BaseCard(
                      color: Colors.blue,
                      borderRadius: 20,
                      child: Column(
                        children: const [
                          Icon(Icons.account_balance),
                          Text('Назначено'),
                          Text('5'),
                        ],
                      ),
                    ),
                    BaseCard(
                      color: Colors.white,
                      borderRadius: 20,
                      child: Column(
                        children: const [
                          Icon(Icons.account_balance),
                          Text('Завершено'),
                          Text('4'),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text('Подходит к концу: '),
                    Text('42%'),
                  ],
                ),
              ],
            ),
          ),
          const TasksBoard(),
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
