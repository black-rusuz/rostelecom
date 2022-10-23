import 'package:flutter/material.dart';

import '../../../../data/model/task_model.dart';
import '../../../../data/utils.dart';
import '../../../../styles.dart';
import '../../../widgets/base_avatar.dart';
import '../../../widgets/base_card.dart';

class TaskPage extends StatelessWidget {
  static const String name = '/task';
  final TaskModel task;

  const TaskPage(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: const Text(
              'Подробнее',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 30, 4),
                child: GestureDetector(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2,
                          color: Styles.secondaryColor.withOpacity(0.1)),
                    ),
                    child: const Icon(Icons.share_rounded, size: 20),
                  ),
                  onTap: () {},
                ),
              )
            ],
          ),
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
                    status: task.status.value,
                    icon: task.icon,
                    iconColor: task.iconColor,
                    color: task.color,
                    slave: task.slave.name,
                    master: task.master?.name,
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
  final String status;
  final IconData icon;
  final Color iconColor;
  final Color color;
  final String slave;
  final String? master;

  const MainInfo({
    super.key,
    required this.name,
    this.description,
    required this.duration,
    required this.endTime,
    required this.status,
    required this.icon,
    required this.iconColor,
    required this.color,
    required this.slave,
    this.master,
  });

  EdgeInsets get padding =>
      const EdgeInsets.symmetric(vertical: 14, horizontal: 20);

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
          padding: padding,
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
        PeopleCard(padding: padding, slave: slave, master: master),
        const SizedBox(height: 12),
        BaseCard(
          padding: padding,
          color: iconColor.withOpacity(0.1),
          border: Border.all(width: 2, color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor, size: 16),
              const SizedBox(width: 6),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: iconColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PeopleCard extends StatelessWidget {
  final String slave;
  final String? master;
  final EdgeInsets padding;

  const PeopleCard({
    super.key,
    required this.padding,
    required this.slave,
    this.master,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: padding,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Куратор',
                    style: TextStyle(color: Styles.greyColor),
                  ),
                  const Expanded(child: SizedBox()),
                  if (master != null)
                    Row(
                      children: [
                        BaseAvatar(
                          size: 20,
                          fontSize: 10,
                          name: Utils.stringToLetters(slave),
                        ),
                        const SizedBox(width: 8),
                        Text(master ?? '',
                            style:
                                const TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                ],
              ),
            ),
            Container(width: 2, height: 46, color: Styles.greyColor),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Исполнитель',
                    style: TextStyle(color: Styles.greyColor),
                  ),
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BaseAvatar(
                        size: 20,
                        fontSize: 10,
                        name: Utils.stringToLetters(slave),
                      ),
                      const SizedBox(width: 8),
                      Text(slave,
                          style: const TextStyle(fontWeight: FontWeight.w600)),
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
