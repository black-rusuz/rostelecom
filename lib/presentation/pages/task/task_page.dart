import 'package:flutter/material.dart';

import '../../../data/model/task_model.dart';
import '../../../data/utils.dart';
import '../../../styles.dart';
import '../../widgets/base_card.dart';

class TaskPage extends StatelessWidget {
  static const String name = '/task';
  final TaskModel task;

  const TaskPage(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainInfo(
                    name: task.name,
                    description: task.description,
                    duration: task.duration.value,
                    endTime: task.endTime,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainInfo extends StatelessWidget {
  final String name;
  final String? description;
  final String duration;
  final DateTime endTime;

  const MainInfo({
    super.key,
    required this.name,
    this.description,
    required this.duration,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Styles.secondaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        if (description != null) const SizedBox(height: 12),
        Text(
          description!,
          style: const TextStyle(color: Styles.greyColor),
        ),
        const SizedBox(height: 20),
        BaseCard(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          color: Colors.white,
          child: Row(
            children: [
              TimeItem(label: duration, icon: Icons.calendar_today_rounded),
              const Expanded(child: SizedBox()),
              TimeItem(
                label: Utils.dateToView(endTime),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Куратор',
                    style: TextStyle(color: Styles.greyColor),
                  ),
                  Expanded(child: SizedBox()),
                  //TODO: masterId
                  Text('Тест тест'),
                ],
              ),
            ),
            Container(width: 2, height: 40, color: Styles.greyColor),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Исполнитель',
                    style: TextStyle(color: Styles.greyColor),
                  ),
                  Expanded(child: SizedBox()),
                  //TODO: slaveId
                  Text('Тест тест'),
                ],
              ),
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
