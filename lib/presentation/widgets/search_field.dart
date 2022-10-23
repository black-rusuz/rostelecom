import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/tasks/bloc/tasks_bloc.dart';
import 'base_text_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      'Найти задачу...',
      icon: const Icon(Icons.search_rounded),
      onChanged: (v) => context.read<TasksBloc>().add(FilterBy(v)),
    );
  }
}
