import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/task_model.dart';
import '../../styles.dart';
import 'base_card.dart';

class TasksBoard extends StatelessWidget {
  final List<TaskModel> tasks;

  const TasksBoard(this.tasks, {super.key});

  Widget durationMapper(String duration) => Text(duration,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18));

  Widget taskMapper(TaskModel task) => TaskCard(task);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.zero,
            indicatorColor: Colors.transparent,
            tabs: TaskDuration.list.map(durationMapper).toList(),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 350,
            child: TabBarView(
              children: [
                Column(
                  children: tasks
                      .where((e) => e.duration == TaskDuration.day)
                      .map(taskMapper)
                      .toList(),
                ),
                Column(
                  children: tasks
                      .where((e) => e.duration == TaskDuration.week)
                      .map(taskMapper)
                      .toList(),
                ),
                Column(
                  children: tasks
                      .where((e) => e.duration == TaskDuration.month)
                      .map(taskMapper)
                      .toList(),
                ),
                Column(
                  children: tasks
                      .where((e) => e.duration == TaskDuration.quarter)
                      .map(taskMapper)
                      .toList(),
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
  final TaskModel task;

  const TaskCard(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 15),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Создать приложение для хакатона',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Tag(),
                      const SizedBox(width: 8),
                      const Tag(),
                      const SizedBox(width: 8),
                      const Tag(),
                      const Expanded(child: SizedBox()),
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
        color: Styles.tagBgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Text(
        'Назначено',
        style: TextStyle(fontSize: 10, color: Styles.greyColor),
      ),
    );
  }
}
