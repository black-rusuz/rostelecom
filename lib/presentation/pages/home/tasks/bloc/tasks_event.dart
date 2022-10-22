part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class TasksInit extends TasksEvent {}

class AddTask extends TasksEvent {}
