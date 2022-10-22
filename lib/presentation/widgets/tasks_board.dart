import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/model/task_model.dart';
import '../../data/utils.dart';
import '../../styles.dart';
import '../pages/task/task_page.dart';
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

  Widget statusTag() {
    switch (task.status) {
      case TaskStatus.notAssigned:
        return Tag(Icons.access_time, title: task.status.value);
      case TaskStatus.inWork:
        return Tag(Icons.loop_rounded,
            title: task.status.value, color: Styles.accentColor);
      case TaskStatus.onReview:
        return Tag(Icons.edit,
            title: task.status.value, color: Styles.secondaryColor);
      case TaskStatus.ready:
        return Tag(Icons.check_rounded,
            title: task.status.value, color: Styles.greenColor);
      case TaskStatus.undefined:
        return Tag(Icons.question_mark_rounded, title: task.status.value);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 15),
      onTap: () => Navigator.of(context).pushNamed(
        TaskPage.name,
        arguments: task,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: task.color,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (task.isHot)
                        const Tag(Icons.local_fire_department,
                            color: Styles.redColor),
                      if (task.isHidden)
                        const Tag(Icons.visibility_off_rounded),
                      statusTag(),
                      Tag(
                        Icons.edit_calendar,
                        title: Utils.dateToView(task.endTime),
                      ),
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
  final IconData icon;
  final String? title;
  final Color? color;

  const Tag(this.icon, {super.key, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color != null ? color?.withOpacity(0.1) : Styles.tagBgColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color ?? Styles.greyColor),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 10,
                  height: 1,
                  color: Styles.greyColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
