import 'package:flutter/material.dart';

import '../../../../styles.dart';
import '../../../widgets/base_card.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        MainInfo(),
      ],
    );
  }
}

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Название',
          style: TextStyle(
            color: Styles.secondaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: TextStyle(color: Styles.greyColor),
        ),
        const SizedBox(height: 20),
        BaseCard(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          color: Colors.white,
          child: Row(
            children: const [
              TimeItem(label: 'День', icon: Icons.calendar_today_rounded),
              Expanded(child: SizedBox()),
              TimeItem(
                label: '22 октября 2022',
                icon: Icons.calendar_month_rounded,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const PeopleCard(),
      ],
    );
  }
}

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: const [Text('Куратор'), Text('Тест тест')],
                ),
                Container(width: 2, height: 40, color: Styles.greyColor),
                Column(
                  children: const [Text('Куратор'), Text('Тест тест')],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TimeItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const TimeItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Styles.greyColor, size: 16),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Styles.secondaryColor),
        ),
      ],
    );
  }
}
