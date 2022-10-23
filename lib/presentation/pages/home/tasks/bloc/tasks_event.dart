part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class TasksInit extends TasksEvent {}

class TasksFetched extends TasksEvent {
  final List<TaskModel> tasks;

  TasksFetched(this.tasks);
}

class AddTask extends TasksEvent {
  final String name;
  final String? description;
  final String duration;
  final bool isHidden;
  final int slaveId;

  AddTask({
    required this.name,
    required this.description,
    required this.duration,
    required this.isHidden,
    required this.slaveId,
  });
}

class FilterBy extends TasksEvent {
  final String pattern;

  const FilterBy(this.pattern);
}

class GetCsv extends TasksEvent {}
