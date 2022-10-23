part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class TasksInit extends TasksEvent {}

class TasksFetched extends TasksEvent {
  final List<TaskModel> tasks;

  TasksFetched(this.tasks);
}

class AddTask extends TasksEvent {}
