import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/search_field.dart';
import '../../../widgets/tasks_board.dart';
import '../tasks/bloc/tasks_bloc.dart';

class HotFragment extends StatelessWidget {
  const HotFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        if (state is TasksSuccess) {
          return Column(
            children: [
              const SearchField(),
              const SizedBox(height: 20),
              TasksBoard(state.tasks.where((e) => e.isHot).toList()),
            ],
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
