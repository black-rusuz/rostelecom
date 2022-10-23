import 'package:flutter/material.dart';

import '../../../data/model/task_model.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_switch.dart';
import '../../widgets/base_text_field.dart';

class TaskForm extends StatelessWidget {
  static const String name = '/new_task';

  const TaskForm({super.key});

  DropdownMenuItem<TaskDuration> durationMapper(TaskDuration duration) =>
      DropdownMenuItem(value: duration, child: Text(duration.value));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новая задача'),
      ),
      body: ListView(
        children: [
          const BaseTextField('Название'),
          const BaseTextField('Описание'),
          DropdownButton<TaskDuration>(
            items: TaskDuration.list.map(durationMapper).toList(),
            onChanged: (v) {},
          ),
          const BaseTextField('Исполнитель'),
          const Text('Подзадачи'),
          const BaseTextField('Название подзадачи'),
          const BaseButton(label: 'Добавить подзадачу', icon: Icons.add),
          const BaseTextSwitch(label: 'Скрытая задача'),
          const BaseButton(label: 'Создать', icon: Icons.add),
        ],
      ),
    );
  }
}
