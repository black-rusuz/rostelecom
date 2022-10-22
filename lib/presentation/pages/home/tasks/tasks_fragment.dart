import 'package:flutter/material.dart';

import '../../../../styles.dart';
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
                icon: Icons.folder_copy_outlined,
                iconBgColor: Color(0xFF5C627A),
                title: 'Задач',
                textColor: Colors.white,
                value: 2,
              ),
              SizedBox(width: 10),
              StatCard(
                color: Styles.accentColor,
                icon: Icons.inventory_rounded,
                iconBgColor: Color(0xFF5999F6),
                title: 'Назначено',
                textColor: Colors.white,
                value: 4,
              ),
              SizedBox(width: 10),
              StatCard(
                color: Colors.white,
                icon: Icons.check_circle_rounded,
                iconBgColor: Color(0xFFECEEF3),
                title: 'Завершено',
                textColor: Styles.secondaryColor,
                value: 5,
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Подходит к концу: ',
                  style: TextStyle(color: Styles.greyColor)),
              Text(
                '42%',
                style: TextStyle(
                  color: Styles.accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final Color color;
  final Color iconBgColor;
  final Color textColor;
  final IconData icon;
  final String title;
  final int value;

  const StatCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
    required this.iconBgColor,
    required this.textColor,
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
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: textColor),
            ),
            const SizedBox(height: 15),
            Text(title, style: TextStyle(color: textColor, fontSize: 12)),
            const SizedBox(height: 15),
            Text(value.toString(),
                style: TextStyle(color: textColor, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
