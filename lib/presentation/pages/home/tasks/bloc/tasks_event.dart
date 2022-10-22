part of 'tasks_bloc.dart';

abstract class TasksEvent {
  const TasksEvent();
}

class AddTask extends TasksEvent {}
