import 'package:flutter/material.dart';

import '../../../data/model/task_model.dart';
import '../../../styles.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_switch.dart';
import '../../widgets/base_text_field.dart';

class TaskForm extends StatelessWidget {
  static const String name = '/new_task';

  const TaskForm({super.key});

  DropdownMenuItem<TaskDuration> durationMapper(TaskDuration duration) =>
      DropdownMenuItem(value: duration, child: Text(duration.value));

  TextStyle get titleStyle => const TextStyle(
        color: Styles.secondaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Новая задача',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
        child: ListView(
          children: [
            const BaseTextField('Название'),
            const SizedBox(height: 12),
            const BaseTextField('Описание'),
            const SizedBox(height: 12),
            DropdownButton<TaskDuration>(
              items: TaskDuration.list.map(durationMapper).toList(),
              onChanged: (v) {},
            ),
            const SizedBox(height: 12),
            const BaseTextField('Исполнитель'),
            const SizedBox(height: 40),
            Text('Подзадачи', style: titleStyle),
            const SizedBox(height: 20),
            const BaseTextField('Название подзадачи'),
            const SizedBox(height: 12),
            const BaseButton(label: 'Добавить подзадачу', icon: Icons.add),
            const SizedBox(height: 40),
            const BaseTextSwitch(label: 'Скрытая задача'),
            const SizedBox(height: 40),
            const BaseButton(
              label: 'Создать',
              icon: Icons.add,
              bgColor: Styles.darkColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
