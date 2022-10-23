import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/task_model.dart';
import '../../../../styles.dart';
import '../../../widgets/base_button.dart';
import '../../../widgets/base_selector.dart';
import '../../../widgets/base_switch.dart';
import '../../../widgets/base_text_field.dart';
import 'bloc/tasks_bloc.dart';

class TaskForm extends StatefulWidget {
  static const String name = '/new_task';

  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final title = TextEditingController();

  final description = TextEditingController();

  final slave = TextEditingController();

  final subTask = TextEditingController();

  String selectedDuration = TaskDuration.stringList.first;

  bool isHidden = false;

  void onTap() => context.read<TasksBloc>().add(AddTask(
        name: title.text,
        description: description.text,
        duration: selectedDuration,
        isHidden: isHidden,
        slaveId: int.tryParse(slave.text) ?? 0,
      ));

  @override
  Widget build(BuildContext context) {
    return BlocListener<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is TaskAddSuccess) {
          Navigator.of(context).pop();
        }
        if (state is TaskAddFail) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Ошибка:\n${state.error}'),
          ));
        }
      },
      child: Scaffold(
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
              BaseTextField('Название', controller: title),
              const SizedBox(height: 15),
              BaseTextField('Описание', lines: 5, controller: description),
              const SizedBox(height: 15),
              BaseSelector(
                values: TaskDuration.stringList,
                onSelect: (v) => setState(() => selectedDuration = v),
              ),
              const SizedBox(height: 15),
              BaseTextField('Исполнитель', controller: slave),
              const SizedBox(height: 40),
              const Text(
                'Подзадачи',
                style: TextStyle(
                  color: Styles.secondaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              BaseTextField('Название подзадачи', controller: subTask),
              const SizedBox(height: 15),
              const BaseButton(label: 'Добавить подзадачу', icon: Icons.add),
              const SizedBox(height: 40),
              BaseTextSwitch(
                label: 'Скрытая задача',
                onTap: (v) => setState(() => isHidden = v),
              ),
              const SizedBox(height: 40),
              BaseButton(
                onTap: onTap,
                label: 'Создать',
                icon: Icons.add,
                bgColor: Styles.darkColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
