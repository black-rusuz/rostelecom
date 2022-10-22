import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'base_card.dart';

class TasksBoard extends StatelessWidget {
  const TasksBoard({super.key});

  final TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TabBar(
              labelPadding: EdgeInsets.zero,
              indicatorColor: Colors.transparent,
              tabs: [
                Text('День', style: textStyle),
                Text('Неделя', style: textStyle),
                Text('Месяц', style: textStyle),
                Text('Квартал', style: textStyle),
              ],
            ),
            const SizedBox(height: 30),
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
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
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
