import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TasksBoard extends StatelessWidget {
  const TasksBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Text('День'),
              Text('Неделя'),
              Text('Месяц'),
              Text('Квартал'),
            ],
          ),
          SizedBox(
            height: 350,
            child: TabBarView(
              children: [
                Column(
                  children: const [
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
                Column(
                  children: const [
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
                Column(
                  children: const [
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
                Column(
                  children: const [
                    TaskCard(),
                    TaskCard(),
                    TaskCard(),
                  ],
                ),
              ],
            ),
          ),
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
