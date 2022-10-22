import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/tasks_board.dart';
import '../tasks/bloc/tasks_bloc.dart';

class HiddenFragment extends StatelessWidget {
  const HiddenFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksSuccess) {
          return TasksBoard(state.tasks.where((e) => e.isHidden).toList());
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
