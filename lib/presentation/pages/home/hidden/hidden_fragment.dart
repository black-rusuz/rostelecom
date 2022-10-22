import 'package:flutter/material.dart';

import '../../../widgets/tasks_board.dart';

class HiddenFragment extends StatelessWidget {
  const HiddenFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const TasksBoard([]);
  }
}
