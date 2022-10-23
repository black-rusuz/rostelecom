import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_card.dart';
import '../../../widgets/base_text_field.dart';
import '../../../widgets/tasks_board.dart';
import 'bloc/tasks_bloc.dart';

class TasksFragment extends StatelessWidget {
  const TasksFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksSuccess) {
          return Column(
            children: [
              const BaseTextField(
                'Найти задачу...',
                icon: Icon(Icons.search_rounded),
              ),
              const SizedBox(height: 20),
              StatsCard(
                percent: state.percent,
                total: state.total,
                assigned: state.assigned,
                done: state.done,
              ),
              const SizedBox(height: 20),
              BaseButton(
                label: 'Выгрузить список в Excel',
                icon: Icons.table_chart_outlined,
                bgColor: Styles.greenColor.withOpacity(0.1),
                textColor: Styles.greenColor,
                border: Border.all(width: 2, color: Colors.white),
              ),
              const SizedBox(height: 40),
              TasksBoard(state.tasks),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class StatsCard extends StatelessWidget {
  final int total;
  final int assigned;
  final int done;
  final int percent;

  const StatsCard({
    super.key,
    required this.percent,
    required this.total,
    required this.assigned,
    required this.done,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      borderRadius: 20,
      child: Column(
        children: [
          Row(
            children: [
              StatCard(
                color: Styles.darkColor,
                icon: Icons.folder_copy_outlined,
                iconBgColor: const Color(0xFF5C627A),
                title: 'Задач',
                textColor: Colors.white,
                value: total,
              ),
              const SizedBox(width: 10),
              StatCard(
                color: Styles.accentColor,
                icon: Icons.inventory_rounded,
                iconBgColor: const Color(0xFF5999F6),
                title: 'Для меня',
                textColor: Colors.white,
                value: assigned,
              ),
              const SizedBox(width: 10),
              StatCard(
                color: Colors.white,
                icon: Icons.check_circle_rounded,
                iconBgColor: const Color(0xFFECEEF3),
                title: 'Завершено',
                textColor: Styles.secondaryColor,
                value: done,
                border: Border.all(width: 1, color: const Color(0xFFF3F3F7)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Подходит к концу: ',
                style: TextStyle(color: Styles.greyColor),
              ),
              Text(
                '$percent%',
                style: const TextStyle(
                  color: Styles.accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
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
  final Border? border;

  const StatCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.value,
    required this.iconBgColor,
    required this.textColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseCard(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        color: color,
        borderRadius: 20,
        border: border,
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
            Text(
              value.toString(),
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
