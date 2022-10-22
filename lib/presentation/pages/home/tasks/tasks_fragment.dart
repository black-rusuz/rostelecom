import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../widgets/base_card.dart';

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
            child: Column(
              children: [
                Row(
                  children: [
                    BaseCard(
                      color: Colors.grey,
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
          Row(
            children: const [
              Text('Сегодня'),
              Text('На этой неделе'),
              Text('В этом месяце'),
              Text('Квартал'),
            ],
          ),
          Column(
            children: const [
              TaskCard(),
              TaskCard(),
              TaskCard(),
            ],
          ),
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

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Создать приложение для хакатона'),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Row(
                      children: const [
                        Tag(),
                        Tag(),
                        Tag(),
                      ],
                    ),
                    ClipOval(
                      child: CachedNetworkImage(
                        width: 30,
                        height: 30,
                        imageUrl: 'https://github.com/gsusha.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  const Tag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Text('Назначено', style: TextStyle(fontSize: 10)),
    );
  }
}
